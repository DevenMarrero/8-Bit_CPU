# include <Arduino_DebugUtils.h>

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
int data;
bool programming = false;


void writeEEPROM(int address, int data){
  // low address
  for (int pin = DATA_0; pin < DATA_7; pin++){
    digitalWrite(pin, address & 1);
    address = address >> 1;
  }
  digitalWrite(MLI, LOW);
  digitalWrite(CLK, LOW);
  digitalWrite(CLK, HIGH);
  digitalWrite(MLI, HIGH);

  // high address
  for (int pin = DATA_0; pin < DATA_7; pin++){
    digitalWrite(pin, address & 1);
    address = address >> 1;
  }
  digitalWrite(MHI, LOW);
  digitalWrite(CLK, LOW);
  digitalWrite(CLK, HIGH);
  digitalWrite(MHI, HIGH);

  // data
  for (int pin = DATA_0; pin < DATA_7; pin++){
    digitalWrite(pin, data & 1);
    data = data >> 1;
  }
  digitalWrite(MDI, LOW);
  digitalWrite(CLK, LOW);
  digitalWrite(CLK, HIGH);
  digitalWrite(MDI, HIGH);
}


void resetLines(){
  // set lines to high-z
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    pinMode(pin, INPUT);
  }

  pinMode(MLI, INPUT);
  pinMode(MHI, INPUT);
  pinMode(MDI, INPUT);
  pinMode(CLK, INPUT);

  // enable control eproms
  analogWrite(control_CE, 0);
}

void setLines(){
  // set data pins to output
  for (int pin = DATA_0; pin <= DATA_7; pin++){
    pinMode(pin, OUTPUT);
  }

  digitalWrite(MLI, HIGH);
  digitalWrite(MHI, HIGH);
  digitalWrite(MDI, HIGH);
  digitalWrite(CLK, HIGH);

  pinMode(MLI, OUTPUT);
  pinMode(MHI, OUTPUT);
  pinMode(MDI, OUTPUT);
  pinMode(CLK, OUTPUT);

  analogWrite(control_CE, 255);
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
    Serial.println(Serial.read());
  }
  else if (Serial.peek() == '>'){
    programming = false;
    resetLines();
    Serial.println(Serial.read());
  }

  if (programming){
    // serial input starts here
    data = Serial.parseInt();
    writeEEPROM(address, data); // Write data to Eprom
    
    Serial.read(); // clear input buffer
    address++;
    //Debug.print(DBG_INFO, "High = %d, Low = %d, data = %d", address >> 8, address & 0b11111111, data);
    Serial.println(data); // ready for next byte
  }
}

