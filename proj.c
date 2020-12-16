#include <stdio.h>
#include <wiringPi.h>
void cross(int pin);
void sblink(int pin, int time);
void sgoLight();

#define RED_LED 16
#define GREEN_LED 21
#define YELLOW_LED 20

#define RED_LED_STOP_ONE 24
#define GREEN_LED_STOP_ONE 23
#define BUTTON_ONE 18

#define RED_LED_STOP_TWO 12
#define GREEN_LED_STOP_TWO 25
#define BUTTON_TWO 17
extern "C" void blink_start();
extern "C" void goLight(int a, int b);

int main(){
	wiringPiSetupGpio();
	
	pinMode(RED_LED, OUTPUT);
	pinMode(YELLOW_LED, OUTPUT);
	pinMode(GREEN_LED, OUTPUT);

	pinMode(RED_LED_STOP_ONE, OUTPUT);
	pinMode(GREEN_LED_STOP_ONE, OUTPUT);
	pinMode(BUTTON_ONE, INPUT);

	pinMode(RED_LED_STOP_TWO, OUTPUT);
	pinMode(GREEN_LED_STOP_TWO, OUTPUT);
	pinMode(BUTTON_TWO, INPUT);	
	while(1){
		digitalWrite(GREEN_LED, HIGH);

		if(digitalRead(BUTTON_ONE) == HIGH){
			sblink(RED_LED_STOP_ONE, 5);
			

		}

		if(digitalRead(BUTTON_TWO) == HIGH){
			sblink(RED_LED_STOP_TWO, 5);	
		}
	}
	

}
void cross(int red,int green){

}

void sgoLight(){
	digitalWrite(12, LOW);
	sblink(12, 13);
	delay(1000);
	sblink(21, 13);
	digitalWrite(21, LOW);

}

void sblink(int pin, int time){
	for(int i = 0; i <= time; i++){
		digitalWrite(pin, LOW);
		digitalWrite(GREEN_LED, LOW);
		delay(100);
		digitalWrite(pin, HIGH);
		digitalWrite(GREEN_LED, HIGH);
		delay(100);
	}

	digitalWrite(GREEN_LED, LOW);
	digitalWrite(pin, LOW);
	digitalWrite(RED_LED, HIGH);
	delay(5000);
	digitalWrite(YELLOW_LED, HIGH);
	delay(5000);
	digitalWrite(RED_LED, LOW);
	digitalWrite(YELLOW_LED, LOW);
	digitalWrite(GREEN_LED, HIGH);
}
