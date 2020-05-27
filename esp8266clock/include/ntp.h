
#include <Arduino.h>
#include <time.h>
#include <sys/time.h>
#include <TZ.h>

class NTP
{
private:
  time_t now;  
public:
  NTP();
  String getTime();
};