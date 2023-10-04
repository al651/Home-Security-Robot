#include <L298NX2.h>
#include <L298N.h>
#include <HCSR04.h>

const unsigned int EN_A = 3;
const unsigned int IN1_A = 5;
const unsigned int IN2_A = 6;

const unsigned int IN3_B = 7;
const unsigned int IN4_B = 8;
const unsigned int EN_B = 9;

byte stopDistance = 30;

HCSR04 hc(11, 12); // (trig pin , echo pin)

L298NX2 Motors(EN_A, IN1_A, IN2_A, EN_B, IN3_B, IN4_B);

L298N rightMotor(IN1_A, IN2_A);
L298N leftMotor(IN3_B, IN4_B);

void setup() {
  Serial.begin(9600);

  while(!Serial){
    
  }
  Motors.setSpeed(200);
}

void loop() {
  
  delay(500);

  if (hc.dist() >= stopDistance){
    Motors.forward();
    while(hc.dist() >= stopDistance){
      delay(500);
    }
      Motors.stop();
      delay(500);
      Motors.backward();
      delay(1500);
      Motors.stop();
      delay(500);
      turnRight();
      Motors.forward();
  }
}

void turnRight(){
  leftMotor.setSpeed(255);
  rightMotor.setSpeed(255);
  leftMotor.forward();
  rightMotor.backward();
  delay(1000);
  leftMotor.setSpeed(200);
  rightMotor.setSpeed(200);
}

void printSomeInfo()
{
  Serial.print("Motor A is moving = ");
  Serial.print(Motors.isMovingA() ? "YES" : "NO");
  Serial.print(" at speed = ");
  Serial.println(Motors.getSpeedA());
  Serial.print("Motor B is moving = ");
  Serial.print(Motors.isMovingB() ? "YES" : "NO");
  Serial.print(" at speed = ");
  Serial.println(Motors.getSpeedB());
}
