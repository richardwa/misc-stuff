
#define GROUND A2
#define VCC A5
#define DATA A4
#define LED 13

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(GROUND, OUTPUT);
  pinMode(VCC, OUTPUT);
  digitalWrite(GROUND, LOW);
  digitalWrite(VCC,HIGH);
  pinMode(DATA, INPUT);
  pinMode(LED,OUTPUT);
  digitalWrite(LED,LOW);

  Serial.begin(9600);
}

int freq = 100;
int last = LOW;
int activate = 0;
unsigned long previousMillis = millis(); 
// the loop function runs over and over again forever
void loop() {
  unsigned long currentMillis = millis();
  int reading = digitalRead(DATA);
  if (reading == HIGH && last == LOW){
    freq++;  
  }
  last = reading;
  if (currentMillis - previousMillis >= 15) {
    previousMillis = currentMillis;
    Serial.println(freq);    
    int led = freq>18 && freq < 24;
    if (led){
      activate++; 
    }else{
      activate=0;
    }
    digitalWrite(LED,activate > 5);
    freq = 0;
  }         


     
}
