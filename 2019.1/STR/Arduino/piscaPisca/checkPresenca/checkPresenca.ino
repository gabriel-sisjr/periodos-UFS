void setup() {
  // put your setup code here, to run once:
  pinMode(6, INPUT);
  pinMode(7, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(6) == 1)
    digitalWrite(7, HIGH);
  else
    digitalWrite(7, LOW);
}
