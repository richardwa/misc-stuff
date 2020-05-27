#include "ntp.h"

NTP::NTP()
{
  configTime(TZ_America_New_York, "pool.ntp.org");
};

String NTP::getTime()
{
  time(&now);
  tm *local = localtime(&now);
  char buffer[6];
  sprintf(buffer, "%02d%02d%02d", local->tm_hour, local->tm_min, local->tm_sec);
  return buffer;
};