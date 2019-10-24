int limit = 500;
int LED = 7;
int PORTA = A2;

void setup () {
  Serial.begin (9600);
  pinMode(LED, OUTPUT);
  Serial.begin (9600);
}

void loop () {
  int sensorValue = analogRead(PORTA);
  if (sensorValue < limit)
    digitalWrite(LED, HIGH);
  else
    digitalWrite(LED, LOW) ;
  float Rsensor;
  Rsensor = (float) (1023-sensorValue) * 10 / sensorValue;
  Serial.println("A resistencia da luz é: ");
  Serial.print (Rsensor, 1);
  Serial.println ("KOhm");
  Serial.println (sensorValue);
}
