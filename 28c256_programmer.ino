void setup() {
  Serial.begin(115200);
}

void loop() {
  // wait until data recieved 
  while (!Serial.available());
  int x = Serial.parseInt();
  Serial.print(x);
}
