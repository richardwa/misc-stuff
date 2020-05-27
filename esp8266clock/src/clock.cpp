#include "clock.h"
#include <TZ.h>

NTPClock::NTPClock()
{
  configTime(TZ_America_New_York, "pool.ntp.org");
};

byte NTPClock::getDigit(byte i)
{
  switch (i)
  {
  case 0:
    return hour / 10;
  case 1:
    return hour % 10;
  case 2:
    return min / 10;
  case 3:
    return min % 10;
  case 4:
    return sec / 10;
  case 5:
    return sec % 10;
  default:
    return 0;
  }
}

void NTPClock::update()
{
  time(&now);
  tm *local = localtime(&now);
  hour = local->tm_hour;
  min = local->tm_min;
  sec = local->tm_sec;
};