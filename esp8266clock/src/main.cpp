#include <LedControl.h>
#include <SPI.h>
#include "fonts.h"

#define NUM_PANELS 4
#define CLK_PIN D5  // or SCK
#define DATA_PIN D7 // or MOSI
#define CS_PIN D4   // or SS

LedControl lc = LedControl(DATA_PIN, CLK_PIN, CS_PIN, NUM_PANELS);

/* we always wait a bit between updates of the display */
unsigned long delaytime = 250;

void setup()
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

unsigned long previousMillis = 0;
unsigned long count = 0;
const long interval = 1000;
uint8_t row[] = {0b11111111, 0b00000000};

void loop()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval)
  {
    previousMillis = currentMillis;
    lc.setRow((count / 8) % 4, count % 8, row[(count / (8 * 4)) % 2]);
    count++;
  }
}