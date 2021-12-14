void setup() {
  Serial.begin(115200);
}

void loop() {
  # wait until data recieved 
  while (!Serial.available());
  x = Serial.readString().toInt();
  Serial.println(x)
  Serial.flush()
}
