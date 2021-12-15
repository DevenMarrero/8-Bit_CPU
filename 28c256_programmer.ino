int address = 0;
char x[1];

void setup() {
  Serial.begin(500000);
}

// recieves a full instruction at a time
// Last byte is a '?' to indicate end
// One '?' send ? back to indicate finish.
void loop() {
  // wait until data recieved 
  while (!Serial.available());

  // serial available
  Serial.readBytes(x, 1);
  Serial.print(x);
}
