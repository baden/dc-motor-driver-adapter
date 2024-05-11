#include "gpio.h"
#include "debug_serial.h"

#define STARTKIT 1

#if defined(STARTKIT)

    #define PIN_LED    PD0   // pin connected to LED (Startkit)

#else

    #define PIN_LED    PA2   // pin connected to LED (Adapter)
#endif

static inline void init(void)
{
//   PIN_input_AN(PIN_PAD);
//   PIN_input_PU(PIN_ACT);
    PIN_output(PIN_LED);
    PIN_high(PIN_LED);

    #if defined(STARTKIT)
        PIN_output(PD4);
        PIN_low(PD4);
    #endif

//   OLED_init();
//   ADC_init();
//   ADC_input(PIN_PAD);

    DEBUG_init();

}


int main(void)
{
    unsigned int counter = 0;

    init();


    PIN_low(PIN_LED);

    while(1)
    {
        PIN_toggle(PIN_LED);
        for (int i = 0; i < 1000000; i++)
        {
            __asm__("nop");
        }

        counter++;

        DEBUG_printf("Tick: %d\n", counter);

        // UART_write('T');
        // UART_write('i');
        // UART_write('c');
        // UART_write('k');
        // UART_write('\n');
    }
}
