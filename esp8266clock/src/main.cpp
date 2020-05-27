#include "display.h"
#include "debug.h"
#include <ESP8266WiFi.h>
#include "wifi-pw.h"
#include "clock.h"

Display display;
NTPClock clk;

void setup()
{
  if (DEBUG)
  {
    Serial.begin(115200);
    while (!Serial.available())
    {
      // wait for serial character
    }
  }

  WiFi.begin(NETWORK, PASSWORD);

  display = Display();
  clk = NTPClock();
}

void loop()
{
  clk.update(); 
  for (byte i = 0; i < 6; i++)
  {
    display.drawDigit(i, clk.getDigit(i));
  }
  
}