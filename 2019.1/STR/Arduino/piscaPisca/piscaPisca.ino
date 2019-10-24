void setup() {
  // put your setup code here, to run once:

  /* 
   *  Tem que configurar tudo primeiro aqui, la no loop é apenas a execução doq foi feito..
   */
  pinMode(13, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  int l = 13;
  digitalWrite(l, HIGH);
  delay(1000);
  digitalWrite(l, LOW);
  delay(1000);

  digitalWrite(l, HIGH);
  delay(100);
  digitalWrite(l, LOW);
  delay(600);

  digitalWrite(l, HIGH);
  delay(50);
  digitalWrite(l, LOW);
  delay(50);
}
