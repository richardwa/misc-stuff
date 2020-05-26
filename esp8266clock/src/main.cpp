#include "clock.h"
#include "debug.h"

Clock cl;
unsigned long previousMillis;
unsigned long count;
unsigned const long interval = 1000; // need 1 second timer

void setup()
{
  Serial.begin(115200);
  while (!Serial.available()){
    //Do Absolutely Nothing until something is received over the serial port
  }
  cl = Clock();
  Serial.println("clock initialized");
  cl.setTime("124852");
}

void loop()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval)
  {
    previousMillis = currentMillis;
    cl.addSecond();
    DB_SHOW(count);
    count++;
  }
}