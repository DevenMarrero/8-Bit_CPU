// # include <Arduino_DebugUtils.h>

# define DATA_0 2
# define DATA_7 9

// Analog active high
# define control_CE A0 //low defualt 

// Digital active low
# define MLI 10
# define MHI 11
# define MDI 12
# define CLK 13

int address = 0;
int data = 0;
bool programming = false;
bool write_high;



void writeEEPROM(int address, int data){
  if ((address & 0b11111111) == 0){
    write_high = true;
  }
  else {
    write_high = false;
  }
  
  // low address
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    digitalWrite(pin, address & 1);
    address = address >> 1;
  }
  digitalWrite(MLI, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, HIGH);
  digitalWrite(MLI, HIGH);

  
  if (write_high){

    // high address
    for (int pin = DATA_0; pin <= DATA_7; pin++){
      digitalWrite(pin, address & 1);
      address = address >> 1;
    }  
    delay(100);
    digitalWrite(MHI, LOW);
    delayMicroseconds(10);
    digitalWrite(CLK, LOW);
    delayMicroseconds(1);
    digitalWrite(CLK, HIGH);
    digitalWrite(MHI, HIGH);
  }

  // data
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    digitalWrite(pin, data & 1);
    data = data >> 1;
  }  
  //delay(1);
  digitalWrite(MDI, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, HIGH);
  digitalWrite(MDI, HIGH);
}


void resetLines(){
  digitalWrite(CLK, HIGH);

  // set lines to high-z
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    pinMode(pin, INPUT);
  }

  digitalWrite(MDI, HIGH);
  digitalWrite(MLI, HIGH);
  digitalWrite(MHI, HIGH);

  pinMode(CLK, INPUT);

  analogWrite(control_CE, 0); // enable control eproms
}

void setLines(){
  
  digitalWrite(MLI, HIGH);
  digitalWrite(MHI, HIGH);
  digitalWrite(MDI, HIGH);
  digitalWrite(CLK, HIGH);

  analogWrite(control_CE, 255); // dsiable control eproms

  pinMode(MLI, OUTPUT);
  pinMode(MHI, OUTPUT);
  pinMode(MDI, OUTPUT);
  pinMode(CLK, OUTPUT);

  // set data pins to output
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    pinMode(pin, OUTPUT);
  }
}


void setup() {
  resetLines();
  Serial.begin(115200);
}


void loop() {
  // wait for serial input
  while(!Serial.available()){}

  if (Serial.peek() == '<'){
    programming = true;
    setLines();
    delay(10);
    Serial.println(Serial.read());
  }
  else if (Serial.peek() == '>'){
    programming = false;
    resetLines();
    Serial.println(Serial.read());
  }

  else if (programming){
    // serial input starts here
    data = Serial.parseInt();
    writeEEPROM(address, data); // Write data to Eprom
    
    Serial.read(); // clear input buffer
    address++;
    //Debug.print(DBG_INFO, "High = %d, Low = %d, data = %d", address >> 8, address & 0b11111111, data);
    delay(100);
    Serial.println(data); // ready for next byte
    
  }
}
