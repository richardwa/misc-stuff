#include <Arduino.h>
#include <avr/pgmspace.h>

// 8x6 font
const byte font_digit_6x8[][6] PROGMEM = {
    {0x7e, 0xff, 0x81, 0x81, 0xff, 0x7e}, //'0' 0
    {0x00, 0x82, 0xff, 0xff, 0x80, 0x00}, //'1' 1
    {0x82, 0xc1, 0xa1, 0x91, 0xcf, 0xc6}, //'2' 2
    {0x42, 0xc1, 0x89, 0x89, 0xff, 0x76}, //'3' 3
    {0x38, 0x24, 0xa2, 0xff, 0xff, 0xa0}, //'4' 4
    {0x4f, 0xcf, 0x89, 0x89, 0xf9, 0x71}, //'5' 5
    {0x7c, 0xfe, 0x8b, 0x89, 0xf9, 0x70}, //'6' 6
    {0x01, 0x81, 0xf1, 0xf9, 0x8f, 0x07}, //'7' 7
    {0x76, 0xff, 0x89, 0x89, 0xff, 0x76}, //'8' 8
    {0x0e, 0x9f, 0x91, 0xd1, 0x7f, 0x3e}, //'9' 9
    {0x62, 0x62, 0x00, 0x00, 0x00, 0x00}, //':' 0xa
    {0x46, 0x46, 0x00, 0x00, 0x00, 0x00}  //':' 0xb
};