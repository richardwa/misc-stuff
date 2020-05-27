#include "clock.h"
#include "debug.h"
#include <ESP8266WiFi.h>
#include "wifi-pw.h"
#include "ntp.h"

Clock cl;
NTP ntp;
unsigned long previousMillis;
unsigned long count;
unsigned const long interval = 5000; // need 1 second timer

void setup()
{
  if (DEBUG)
  {
    Serial.begin(115200);
    while (!Serial.available())
    {
      //Do Absolutely Nothing until something is received over the serial port
    }
  }

  WiFi.begin(NETWORK, PASSWORD);

  ntp = NTP();
  cl = Clock();

  String time = ntp.getTime();
  PRINT(time);
  PRINT("clock initialized");

  cl.setTime("123456");
}

void loop()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval)
  {
    previousMillis = currentMillis;
    cl.addSecond();
    PRINT(ntp.getTime());
    SHOW(count);
    count++;
  }
}