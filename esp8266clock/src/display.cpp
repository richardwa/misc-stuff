#include <Arduino.h>
#include "display.h"
#include "fonts.h"
#include "debug.h"

Display::Display()
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

void Display::drawDigit(byte i, byte val)
{
  if (val == values[i]){
    return; // nothing to update
  }
  values[i] = val;
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
