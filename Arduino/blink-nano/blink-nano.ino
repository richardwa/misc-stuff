

#define MINUTE 60000

// constants won't change. Used here to set a pin number:
const int controlPin =  2;
const int ledPin =  13;
const unsigned long onInterval = MINUTE/6;
const unsigned long offInterval = 10 * MINUTE;
const unsigned long totalPeriod = onInterval + offInterval;


void setup() {
  // set the digital pin as output:
  pinMode(controlPin, OUTPUT);
}

void loop() {
  // here is where you'd put code that needs to be running all the time.

  // check to see if it's time to blink the LED; that is, if the difference
  // between the current time and last time you blinked the LED is bigger than
  // the interval at which you want to blink the LED.
  unsigned long currentMillis = millis();
  unsigned long truncated = currentMillis % totalPeriod;
  if (truncated < onInterval){
    digitalWrite(ledPin, HIGH);
    digitalWrite(controlPin, HIGH);
  }else{
    digitalWrite(ledPin, LOW);
    digitalWrite(controlPin, LOW);
  }
}
