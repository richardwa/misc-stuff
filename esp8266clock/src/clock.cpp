#include <Arduino.h>
#include "clock.h"
#include "fonts.h"
#include "debug.h"

Clock::Clock()
{
  for (int i = 0; i < NUM_PANELS; i++)
  {
    lc.shutdown(i, false);
    /* Set the brightness to a medium values */
    lc.setIntensity(i, 8);
    /* and clear the display */
    lc.clearDisplay(i);
  }
}

void Clock::drawDigit(byte panel, byte col, const byte *bitmap, byte size)
{
  for (byte i = 0; i < size; i++)
  {
    byte _panel = panel + (col + i) / 8;
    byte _col = (col + i) % 8;
    DB_SHOW(_panel);
    DB_SHOW(_col);
    DB_SHOW(bitmap[i]);
    lc.setColumn(_panel, 7 - _col, bitmap[i]);
  }
}

void Clock::setTime(const String str) //hhmmss
{
  for (byte i = 0; i < str.length(); i++)
  {
    byte val = str[i] - '0';
    if (val != value[i])
    {
      value[i] = val;
      DB_SHOW(val);
      if (i < 4)
      {
        drawDigit(pan[i], col[i], &font_digit_6x8[val * 6], 6);
      }
      else
      {
        drawDigit(pan[i], col[i], &font_abacus_1x8[val], 1);
      }
    }
  }
}

void Clock::addSecond()
{
}