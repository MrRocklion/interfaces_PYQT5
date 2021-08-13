// librerias
#include <Servo.h>
//variables de los pines digitales
int led1 =  52;
int led2 = 50;
int led3 = 48;
int led4 = 46;
int led5 = 44;
//variables del servomotor
Servo servo1;
// variables de las constantes para la separacion de caracteres por algun caracater
String dataRecepted = "";
const char separator = ',';
const int dataLength = 2;
String data[dataLength];
void setup() {
pinMode(led1,OUTPUT);
pinMode(led2,OUTPUT);
pinMode(led3,OUTPUT);
pinMode(led4,OUTPUT);
pinMode(led5,OUTPUT);
servo1.attach(2);
servo1.write(10);
Serial.begin(9600);

}

void loop() {
while (Serial.available())
   { 
    dataRecepted = Serial.readStringUntil('\n');
     for (int i = 0; i < dataLength ; i++)
      {
         int index = dataRecepted.indexOf(separator);
         data[i] = dataRecepted.substring(0, index);
         dataRecepted = dataRecepted.substring(index+1);
      }
    //CONDICION PARA PRIMER LED 
    if(data[0] == "LED1"){
    if (data[1] == "ON"){
    digitalWrite(led1,HIGH);
    }else{
      digitalWrite(led1,LOW);
      }
    }
    //CONDICION PARA SEGUNDO LED 
        if(data[0] == "LED2"){
    if (data[1] == "ON"){
    digitalWrite(led2,HIGH);
    }else{
      digitalWrite(led2,LOW);
      }
    }
    //CONDICION PARA TERCER LED 
            if(data[0] == "LED3"){
    if (data[1] == "ON"){
    digitalWrite(led3,HIGH);
    }else{
      digitalWrite(led3,LOW);
      }
    }
    //CONDICION PARA CUARTO LED
    if(data[0] == "LED4"){
      if (data[1] == "ON"){
        digitalWrite(led4,HIGH);
      }else{
        digitalWrite(led4,LOW);
      }
    }
     //CONDICION PARA QUINTO LED
    if(data[0] == "LED5"){
      if (data[1] == "ON"){
        digitalWrite(led5,HIGH);
      }else{
        digitalWrite(led5,LOW);
      }
    }
    // CONDICION PARA EL SERVOMOTOR
      if(data[0] == "SERVO1"){
        if(data[1].toInt()<=180 && data[1].toInt()>=10){
          servo1.write(data[1].toInt());
          Serial.println(data[1]);
          }
      
    }







     
}}
