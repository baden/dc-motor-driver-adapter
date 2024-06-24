#include <stdbool.h>
#include "gpio.h"
#include "debug_serial.h"
#include "uart_rx.h"
#include "crsf.h"
#include "dac.h"
#include "system.h"


// Device modes:
// 1 - Керування лебідкою по каналу 12
// 2 - Керування лівим бортом по каналах 1 та 2  (1+2)
// 3 - Керування правим бортом по каналах 1 та 2 (2-1)

#define DEVICE_MODE 3

//#define STARTKIT 1

#if defined(STARTKIT)

    #define PIN_LED    PD0   // pin connected to LED (Startkit)

#else

#endif


static inline void init(void)
{
    #if defined(STARTKIT)
        PIN_output(PIN_LED);
        PIN_high(PIN_LED);

        PIN_output(PC0);   // "+" for LED
        PIN_high(PC0);
    #endif

    #if 0
    PIN_input_PD(PD6); // Вхід для PPM (UART) (підтягнутий до землі)
    #endif

    // SYS_init();
    UART_init();
    dac_init();
    #if DEVICE_MODE == 1
    dac_write(2730);        // TODO: Підібрати напругу 12В
    #else
    dac_write(4095);
    #endif

#if 0
    // Configure PD6 as interrupt input
    // The "port" is:
    // 0 for Port A
    // 1 for Port B
    // 2 for Port C
    // 3 for Port D
    #define _portno 3
    #define _pin 6

    RCC->APB2PCENR |= RCC_AFIOEN;
	// Configure the IO as an interrupt.
    AFIO->EXTICR = _portno << (_pin * 2);
	EXTI->INTENR = EXTI_INTENR_MR6; // Enable EXT6
	EXTI->RTENR = EXTI_RTENR_TR6;  // Rising edge trigger
    EXTI->FTENR = EXTI_FTENR_TR6;  // Falling edge trigger

    // enable pin-change-interrupt.
    NVIC_EnableIRQ( EXTI7_0_IRQn );
#endif

#if 0
    RCC->APB2PCENR |= RCC_TIM1EN; // enable TIM1 clock
    // RCC->APB2PRSTR = RCC_TIM1RST;
	// RCC->APB2PRSTR = 0;

	TIM1->ATRLR = 0xffff;
	TIM1->PSC = 47; // 48MHz/(47+1) -> 1µs resolution

    // D2 Capture Input(T1CH1)
    // PA1 - T1CH2

	TIM1->CHCTLR1 = TIM_CC1S_0 | TIM_CC2S_1;

	TIM1->CCER = TIM_CC1E|TIM_CC2E|TIM_CC2P;

	TIM1->CTLR1 = TIM_CEN;

	NVIC_EnableIRQ(TIM1_CC_IRQn);
	TIM1->DMAINTENR = TIM_CC1IE|TIM_CC2IE;    
#endif

//   ADC_init();
//   ADC_input(PIN_PAD);

    // DEBUG_init();
}

#if 0
volatile unsigned int counter = 0;
volatile uint32_t last_value = 0;

void EXTI7_0_IRQHandler( void ) __attribute__((interrupt));
void EXTI7_0_IRQHandler( void ) 
{
    static uint32_t starttime;

    PIN_high(PC1);
    unsigned pin = PIN_read(PD6);

    if(pin != 0) {
        starttime = STK->CNT;
    } else {
        last_value = STK->CNT - starttime;
    }
	EXTI->INTFR = EXTI_INTF_INTF6;
    PIN_low(PC1);
}
#endif

#if DEVICE_MODE == 1

static void rxFoo()
{
    int val = channel[12 -1];

    // Middle = 1044
    // Low = 191
    // High = 1792

    if(val < 500) {
        #if defined(STARTKIT)
            PIN_low(PIN_LED);
        #endif
        PIN_high(PC4);
        PIN_low(PA2);
    } else if(val > 1500) {
        #if defined(STARTKIT)
            PIN_low(PIN_LED);
        #endif
        PIN_low(PC4);
        PIN_high(PA2);
    } else {
        #if defined(STARTKIT)
            PIN_high(PIN_LED);
        #endif
        PIN_low(PC4);
        PIN_low(PA2);
    }
}

#define LOW_PASS_FILTER

#elif (DEVICE_MODE == 2) || (DEVICE_MODE == 3) 

static void rxFoo()
{
    // bool in_dead_zone = false;

    #ifdef LOW_PASS_FILTER
    static int last_dac_val = 0;
    #endif

    // CRSF center value is 992
    #define CENTER_X 992
    #define CENTER_Y 992
    #define MAX_X 820
    #define MAX_Y 820
    #define DEAD_ZONE 10

    int X = channel[1 -1] - CENTER_X;   // -MAX_X to MAX_X
    int Y = channel[2 -1] - CENTER_Y;   // -MAX_Y to MAX_Y

    #if (DEVICE_MODE == 2)
        int dac_val = (X+Y);
    #else
        int dac_val = (Y-X);
    #endif
    #ifdef LOW_PASS_FILTER
        int _dac = dac_val;
        dac_val = (dac_val + last_dac_val) / 2;
        last_dac_val = _dac;
    #endif

    if((dac_val < DEAD_ZONE) && (dac_val > -DEAD_ZONE)) {
        dac_write(4095);
        PIN_low(PC4);
        PIN_low(PA2);
    } else {
        if(dac_val > 0) {
            PIN_low(PC4);
            PIN_high(PA2);
        } else {
            PIN_low(PA2);
            PIN_high(PC4);
            dac_val = -dac_val;
        }

        dac_val *= 5; // (channel[3 -1] - 1000) * 4096 / 1000;
        if(dac_val < 0) {
            dac_val = 0;
        } else if(dac_val > 4095) {
            dac_val = 4095;
        }
        dac_write(4095-dac_val);


    }

}

#endif

int main(void)
{
    // PIN_output(PC1);

    PIN_output(PC4);    // Right
    PIN_output(PA2);    // Left

    init();

    #if defined(STARTKIT)
        PIN_low(PIN_LED);
    #endif

    // DEBUG_println("Start");

    // uint32_t next_tick = STK->CNT + 1000 * DLY_MS_TIME;

//   while(((int32_t)(STK->CNT - end)) < 0);


    while(1)
    {
        // #if defined(STARTKIT)
        //     PIN_toggle(PIN_LED);
        // #endif
        // DLY_ms(500);

        if(UART_available()) {
            char c = USART1->DATAR;
            rxParseByte(c);
            // PIN_toggle(PIN_LED);

            if(crsf_frame_ready) {
                crsf_frame_ready = false;
                rxFoo();
            }
        }

        // if(((int32_t)(STK->CNT - next_tick)) < 0) {
        //     next_tick += 1000 * DLY_MS_TIME;
        // //     // dac_write(0);

        //     PIN_toggle(PC4);
        // //     // PIN_high(PC4);

        // }

    #if 0
        counter++;
        uint32_t duration = last_value / (F_CPU / 1000000);        // Значення у мікросекундах

        DEBUG_printf("Counter: %d  Last value: %d  Duration: %d\n", counter, last_value, duration);
    #endif
    }
}
