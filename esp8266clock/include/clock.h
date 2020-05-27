
#include <Arduino.h>
#include <time.h>
#include <sys/time.h>
#include <TZ.h>

class Clock
{
private:
  time_t now;

public:
  Clock();
  String getTime();
};