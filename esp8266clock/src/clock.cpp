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

void Clock::drawDigit(byte i)
{
  byte val = values[i];
  byte pan = panels[i];
  byte col = columns[i];
  byte size;
  const byte *bitmap;

  if (i < 4)
  {
    size = 6;
    bitmap = &font_digit_6x8[val * size];
  }
  else
  {
    size = 1;
    bitmap = &font_abacus_1x8[val * size];
  }

  for (byte i = 0; i < size; i++)
  {
    byte _panel = pan + (col + i) / 8;
    byte _col = (col + i) % 8;
    SHOW(_panel);
    SHOW(_col);
    SHOW(bitmap[i]);
    lc.setColumn(_panel, 7 - _col, bitmap[i]);
  }
}

void Clock::setTime(const String str) //hhmmss
{
  for (byte i = 0; i < 6; i++)
  {
    byte val = str[i] - '0';
    if (val != values[i])
    {
      values[i] = val;
      drawDigit(i);
    }
  }
}

void Clock::addSecond()
{
  for (byte i = 2; i >= 0; i--)
  {
    byte j = i * 2;
    byte next = values[j] * 10 + values[j + 1] + 1;

    if (next >= limits[i])
    {
      values[j] = 0;
      values[j + 1] = 0;
      drawDigit(j);
      drawDigit(j + 1);
      continue;
    }

    if (values[j] != next / 10)
    {
      values[j] = next / 10;
      drawDigit(j);
    }

    values[j + 1] = next % 10;
    drawDigit(j + 1);
    break;
  }
}