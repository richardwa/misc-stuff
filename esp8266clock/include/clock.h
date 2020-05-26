#include <Arduino.h>
#include <LedControl.h>
#include <SPI.h>

#define CLK_PIN D5  // or SCK
#define DATA_PIN D7 // or MOSI
#define CS_PIN D4   // or SS

const static byte NUM_PANELS = 4;

class Clock
{
private:
  LedControl lc = LedControl(DATA_PIN, CLK_PIN, CS_PIN, NUM_PANELS);

  byte value[6]; //hhmmss

  // panel mapping of each digit val
  byte pan[6] = {0, 0, 2, 3, 1, 2};
  byte col[6] = {0, 7, 3, 2, 7, 0};

  void drawDigit(byte panel, byte col, const byte *bitmap, byte size);

public:
  Clock();
  void setTime(const String str); //hhmmss format
  void addSecond();
};