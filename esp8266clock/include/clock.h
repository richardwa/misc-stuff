
#include <Arduino.h>
#include <time.h>

class NTPClock
{
private:
  time_t now;
  byte hour;
  byte min;
  byte sec;

public:
  NTPClock();
  byte getDigit(byte i);
  void update();
};