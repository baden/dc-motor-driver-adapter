#include "gpio.h"
#include "debug_serial.h"

#define STARTKIT 1

#if defined(STARTKIT)

    #define PIN_LED    PD0   // pin connected to LED (Startkit)

#else

    #define PIN_LED    PA2   // pin connected to LED (Adapter)
#endif

#define EXTI_Line3     ((uint32_t)0x00008) /* External interrupt line 3 */

static inline void init(void)
{
//   PIN_input_AN(PIN_PAD);
//   PIN_input_PU(PIN_ACT);
    PIN_output(PIN_LED);
    PIN_high(PIN_LED);

    #if defined(STARTKIT)
        PIN_output(PC0);
        PIN_high(PC0);

        PIN_output(PD4);
        PIN_low(PD4);
    #endif

    PIN_input(PA1); // Вхід для PPM
    PIN_input(PD2); // Вхід для PPM
    PIN_input(PD3); // Вхід для PPM
    PIN_input(PD6); // Вхід для PPM

    // Configure PD6 as interrupt input
    // The "port" is:
    // 0 for Port A
    // 1 for Port B
    // 2 for Port C
    // 3 for Port D
    // #define portno 3
    // #define pin 6

    // // AFIO->EXTICR |= 0x02 << (2 * 6); // PC6
    // AFIO->EXTICR = portno << (pin * 2);
    // // EXTI->INTENR |= EXTI_INTENR_MR6;
    // EXTI->INTENR = 0xffffffff;
	// // EXTI->FTENR |= EXTI_FTENR_TR6;
    // // EXTI->RTENR = EXTI_RTENR_TR6;   // Rising edge trigger
    // EXTI->RTENR = 0xffffffff;   // Rising edge trigger

    // #define RCC_APB2Periph_AFIO              ((uint32_t)0x00000001)

    RCC->APB2PCENR |= RCC_AFIOEN;
#define AFIO_EXTICR_EXTI3_PD                    ((uint16_t)0x00C0) /* PD[3] pin */
	// Configure the IO as an interrupt.
	AFIO->EXTICR = AFIO_EXTICR_EXTI3_PD;
	EXTI->INTENR = EXTI_INTENR_MR3; // Enable EXT3
	EXTI->RTENR = EXTI_RTENR_TR3;  // Rising edge trigger
    EXTI->FTENR = EXTI_FTENR_TR3;  // Falling edge trigger

    // enable pin-change-interrupt.
    NVIC_EnableIRQ( EXTI7_0_IRQn );

    // Configure PD6 as interrupt input
    // AFIO->EXTICR = AFIO_EXTICR1_EXTI2_PD;
    // EXTI->INTMR = EXTI_IMR_MR2;

    RCC->APB2PCENR |= RCC_TIM1EN; // enable TIM1 clock
    // RCC->APB2PRSTR = RCC_TIM1RST;
	// RCC->APB2PRSTR = 0;


	TIM1->ATRLR = 0xffff;
	TIM1->PSC = 47; // 48MHz/(47+1) -> 1µs resolution

#if 0
    // D2 Capture Input(T1CH1)
    // PA1 - T1CH2

	TIM1->CHCTLR1 = TIM_CC1S_0 | TIM_CC2S_1;

	TIM1->CCER = TIM_CC1E|TIM_CC2E|TIM_CC2P;

	TIM1->CTLR1 = TIM_CEN;

	NVIC_EnableIRQ(TIM1_CC_IRQn);
	TIM1->DMAINTENR = TIM_CC1IE|TIM_CC2IE;    
#endif
    // GPIOD->CFGLR =

//   OLED_init();
//   ADC_init();
//   ADC_input(PIN_PAD);

    DEBUG_init();

}

// #define queuelen 16
// volatile uint32_t captureVals[queuelen];
// volatile size_t write = 0;

volatile unsigned int counter = 0;
volatile uint32_t last_value = 0;

#define FUN_HIGH 0x1
#define FUN_LOW 0x0

// Arduino-like GPIO Functionality
#define GpioOf( pin ) ((GPIO_TypeDef *)(GPIOA_BASE + 0x400 * ((pin)>>4)))

/* General Purpose I/O */
typedef enum
{
	GPIO_CFGLR_IN_ANALOG = 0,
	GPIO_CFGLR_IN_FLOAT = 4,
	GPIO_CFGLR_IN_PUPD = 8,
	GPIO_CFGLR_OUT_10Mhz_PP = 1,
	GPIO_CFGLR_OUT_2Mhz_PP = 2,
	GPIO_CFGLR_OUT_50Mhz_PP = 3,
	GPIO_CFGLR_OUT_10Mhz_OD = 5,
	GPIO_CFGLR_OUT_2Mhz_OD = 6,
	GPIO_CFGLR_OUT_50Mhz_OD = 7,
	GPIO_CFGLR_OUT_10Mhz_AF_PP = 9,
	GPIO_CFGLR_OUT_2Mhz_AF_PP = 10,
	GPIO_CFGLR_OUT_50Mhz_AF_PP = 11,
	GPIO_CFGLR_OUT_10Mhz_AF_OD = 13,
	GPIO_CFGLR_OUT_2Mhz_AF_OD = 14,
	GPIO_CFGLR_OUT_50Mhz_AF_OD = 15,
} GPIO_CFGLR_PIN_MODE_Typedef;

#define funDigitalWrite( pin, value ) { GpioOf( pin )->BSHR = 1<<((!(value))*16 + ((pin) & 0xf)); }
#define funPinMode( pin, mode ) { *((&GpioOf(pin)->CFGLR)+((pin&0x8)>>3)) = ( (*((&GpioOf(pin)->CFGLR)+((pin&0x8)>>3))) & (~(0xf<<(4*((pin)&0x7))))) | ((mode)<<(4*((pin)&0x7))); }


void TIM1_CC_IRQHandler(void) __attribute__((interrupt));
void TIM1_CC_IRQHandler(void)
{
    PIN_high(PC1);
    asm volatile("nop");
    PIN_low(PC1);
    // funDigitalWrite( PC1, FUN_HIGH );
	// funDigitalWrite( PC1, FUN_LOW );
	// capture
	if(TIM1->INTFR & TIM_CC1IF)
	{
		// get capture
		// captureVals[write++] = 0x00010000 | TIM1->CH1CVR; // capture value
        last_value = TIM1->CH1CVR; // capture value
        // counter++;
		// if (write == queuelen)
		// {
		// 	write = 0;
		// }
		// overflow
		if(TIM1->INTFR & TIM_CC1OF)
		{
			// clear
			TIM1->INTFR = ~(TIM_CC1OF); // cleard by writing 0
			// printf("OF1\n");
		}
	}
	else if (TIM1->INTFR & TIM_CC2IF)
	{
		// get capture
		// captureVals[write++] = TIM1->CH2CVR; // capture valur
        // last_value = TIM1->CH2CVR; // capture value
        TIM1->CH2CVR; // capture value for clear flag
		// if (write == queuelen)
		// {
		// 	write = 0;
		// }
		// overflow
		if(TIM1->INTFR & TIM_CC2OF)
		{
			// clear
			TIM1->INTFR = ~(TIM_CC2OF); // cleard by writing 0
			// printf("OF0\n");
		}
	}
	else
	{
		// printf("badtrigger\n");
	}
}


void EXTI7_0_IRQHandler( void ) __attribute__((interrupt));
void EXTI7_0_IRQHandler( void ) 
{
    PIN_high(PC1);
    asm volatile("nop");
    PIN_low(PC1);
    unsigned pin = PIN_read(PD3);

    if(pin != 0) {
        // Reset Timer1
        TIM1->CTLR1 = 0;
        TIM1->CNT = 0;
        TIM1->CTLR1 = TIM_CEN;
    } else {
        TIM1->CTLR1 = 0;
        last_value = TIM1->CNT;
    }
	// endtime = SysTick->CNT;
	// EXTI->INTFR = 0xffffffff;

    // Acknowledge the interrupt
	EXTI->INTFR = EXTI_Line3;
}

int main(void)
{
    // funPinMode( PC1,  GPIO_CFGLR_OUT_10Mhz_PP );
    // funDigitalWrite( PC1, FUN_HIGH );

    PIN_output(PC1);

    init();
    PIN_high(PC1);


    PIN_low(PIN_LED);

    while(1)
    {
        PIN_toggle(PIN_LED);
        for (int i = 0; i < 1000000; i++)
        {
            __asm__("nop");
        }

        counter++;

        DEBUG_printf("Counter: %d  Last value: %d\n", counter, last_value / 10);

        // UART_write('T');
        // UART_write('i');
        // UART_write('c');
        // UART_write('k');
        // UART_write('\n');
    }
}
