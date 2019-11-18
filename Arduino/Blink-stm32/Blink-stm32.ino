/*
  arduino setup.
  - set preferences to use github repo misc-stuff/Arduino as our projects library

  hardware setup.
  - ensure blue pill has 10k resistor connected on A12 and 3.3v -- this fixes a hardware bug that renders the usb not recognizable by a computer.
  - flash boot loader (misc-stuff/updater_stm32f1) onto board via serial.  after this we can leave jumpers on normal mode

  board: Generic STM32F103C series
  
  to upload an external hex file use 
    misc-stuff\Arduino\hardware\Arduino_STM32\tools\win\stm32loader.py
  
*/
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(PC13, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(PC13, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(PC13, LOW);    // turn the LED off by making the voltage LOW
  delay(100);                       // wait for a second
}
