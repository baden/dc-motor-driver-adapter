#pragma once

#include <stdint.h>
#include <stdbool.h>


void rxParseByte(uint8_t c);

extern volatile int channel[16];
extern volatile bool crsf_frame_ready;
