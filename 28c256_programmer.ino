#define CONTROL_CE 0;
#define CLK 0;
#define ML 0;
#define MH 0;
#define MDI 0;

#define d_0 2;
#define d_7 9;

int address = 0;
int data = 0;
bool programming = false

void setup() {
  for (int i = 0; i < 10; i++){

  }

  Serial.begin(9600);
}

void writeEEPROM(int address, int data){
  // low address
  for (int pin = d_0; pin < d_7; pin++){
    digitalWrite(pin, address & 1);
    address = address >> 1;
  }
  digitalWrite(ML, HIGH);
  digitalWrite(CLK, HIGH);
  digitalWrite(CLK, LOW);
  digitalWrite(ML, LOW);

  // high address
  for (int pin = d_0; pin < d_7; pin++){
    digitalWrite(pin, address & 1);
    address = address >> 1;
  }
  digitalWrite(MH, HIGH);
  digitalWrite(CLK, HIGH);
  digitalWrite(CLK, LOW);
  digitalWrite(MH, LOW);

  // data
  for (int pin = d_0; pin < d_7; pin++){
    digitalWrite(pin, data & 1);
    data = data >> 1;
  }
  digitalWrite(MDI, HIGH);
  digitalWrite(CLK, HIGH);
  digitalWrite(CLK, LOW);
  digitalWrite(MDI, LOW);
}

// recieves a full instruction at a time
void loop() {
  // wait until data recieved 
  while (!Serial.available()){
    // if no serial for 1 sec then disable programming
    programming = false;
    digitalWrite(control_CE, LOW);
  }

  digitalWrite(control_CE, HIGH);

  // serial available
  data = Serial.parseInt();
  Serial.print(data);

  writeEEPROM(address, data);
  address++;
}
