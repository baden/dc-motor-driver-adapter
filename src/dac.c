#include "dac.h"


// MCP4725
#define MCP4725_ADDR 0x60

void dac_init()
{
    // Enable DAC
    I2C_init();

    
}

/* Defines for field values in MCP4725 DAC register */
#define MCP4725_DAC_MAX_VAL			0xFFF

#define MCP4725_FAST_MODE_POWER_DOWN_POS	4U
#define MCP4725_FAST_MODE_DAC_UPPER_VAL_POS	8U
#define MCP4725_FAST_MODE_DAC_UPPER_VAL_MASK	0xF
#define MCP4725_FAST_MODE_DAC_LOWER_VAL_MASK	0xFF

/* WRITE_MODE_FAST message format (2 bytes):
    *
    * ||     15 14     |        13 12        |    11 10 9 8    || 7 6 5 4 3 2 1 0 ||
    * || Fast mode (0) | Power-down bits (0) | DAC value[11:8] || DAC value[7:0]  ||
*/

void dac_write(uint16_t value)
{
    if(value > MCP4725_DAC_MAX_VAL)
    {
        value = MCP4725_DAC_MAX_VAL;
    }
    I2C_start(MCP4725_ADDR << 1);

    uint8_t tx_data_0 = ((value >> MCP4725_FAST_MODE_DAC_UPPER_VAL_POS) &
		MCP4725_FAST_MODE_DAC_UPPER_VAL_MASK);
	uint8_t tx_data_1 = (value & MCP4725_FAST_MODE_DAC_LOWER_VAL_MASK);

    // I2C_write(0x40); // Write to DAC register
    I2C_write(tx_data_0); // MSB
    I2C_write(tx_data_1); // LSB
    I2C_stop();
}
