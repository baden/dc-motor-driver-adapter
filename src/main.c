#include "gpio.h"


#define PIN_LED    PD0   // pin connected to LED

static inline void init(void)
{
//   PIN_input_AN(PIN_PAD);
//   PIN_input_PU(PIN_ACT);
  PIN_output(PIN_LED);
  PIN_high(PIN_LED);
//   OLED_init();
//   ADC_init();
//   ADC_input(PIN_PAD);
}


int main(void)
{
    init();


    PIN_low(PIN_LED);

    while(1)
    {
        PIN_toggle(PIN_LED);
        for (int i = 0; i < 1000000; i++)
        {
            __asm__("nop");
        }
    }
}
