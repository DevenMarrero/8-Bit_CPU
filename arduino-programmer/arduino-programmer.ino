// # include <Arduino_DebugUtils.h>

// bus data pins
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
  // high address only needs to be written every 255 bytes
  // only write high if low address is 0 and has carried over
  write_high = ((address & 0b11111111) == 0);
  
  // low address
  // address on bus
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    digitalWrite(pin, address & 1);
    address = address >> 1;
  }
  // memory address low write sequence
  digitalWrite(MLI, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, HIGH);
  digitalWrite(MLI, HIGH);

  //high address
  if (write_high){
    // address on bus
    for (int pin = DATA_0; pin <= DATA_7; pin++){
      digitalWrite(pin, address & 1);
      address = address >> 1;
    }  
    delay(1);
    // memory address high write sequence
    digitalWrite(MHI, LOW);
    delayMicroseconds(10);
    digitalWrite(CLK, LOW);
    delayMicroseconds(1);
    digitalWrite(CLK, HIGH);
    digitalWrite(MHI, HIGH);
  }

  // data
  // loop through pins and shift data across them
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    digitalWrite(pin, data & 1);
    data = data >> 1;
  }  
  // memory write sequence
  digitalWrite(MDI, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, LOW);
  delayMicroseconds(1);
  digitalWrite(CLK, HIGH);
  digitalWrite(MDI, HIGH);
}


void resetLines(){
  // sets arduino pins to high impedance, essentially disconnecting it
  digitalWrite(CLK, HIGH);

  // set data lines to high-z
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    pinMode(pin, INPUT);
  }

  digitalWrite(MDI, HIGH);
  digitalWrite(MLI, HIGH);
  digitalWrite(MHI, HIGH);

  // memory lines to high-z
  pinMode(MDI, INPUT);
  pinMode(MLI, INPUT);
  pinMode(MHI, INPUT);
  pinMode(CLK, INPUT);

  analogWrite(control_CE, 0); // enable control eproms
}


void setLines(){
  // disables control logic and takes over memory controls
  digitalWrite(MLI, HIGH);
  digitalWrite(MHI, HIGH);
  digitalWrite(MDI, HIGH);
  digitalWrite(CLK, HIGH);

  analogWrite(control_CE, 255); // dsiable control eproms

  // take control of memory lines
  pinMode(MLI, OUTPUT);
  pinMode(MHI, OUTPUT);
  pinMode(MDI, OUTPUT);
  pinMode(CLK, OUTPUT);

  // set bus data pins to output
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
  while(!Serial.available()){
    delay(5);
  }

  // recieved start signal for upload
  if (Serial.peek() == '<'){
    programming = true;
    setLines();
    delay(10);
    Serial.println(Serial.read());
  }
  // recieved end signal for upload
  else if (Serial.peek() == '>'){
    programming = false;
    resetLines();
    Serial.println(Serial.read());
  }
  // recieved data between start and end signals
  else if (programming){
    // serial input starts here
    data = Serial.parseInt();
    writeEEPROM(address, data); // Write data to Eprom
    Serial.read(); // clear input buffer
    address++; // next byte will write to next address

    //Debug.print(DBG_INFO, "High = %d, Low = %d, data = %d", address >> 8, address & 0b11111111, data);

    delay(10); // give CPU time to write memory
    Serial.println(data); // ready for next byte
  }
}
