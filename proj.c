#include <stdio.h>
#include <wiringPi.h>

#define RED_LED 16
#define GREEN_LED 21
#define YELLOW_LED 20

#define RED_LED_STOP_ONE 24
#define GREEN_LED_STOP_ONE 23
#define BUTTON_ONE 18

#define RED_LED_STOP_TWO 12
#define GREEN_LED_STOP_TWO 25
#define BUTTON_TWO 17
extern "C" void blink_start(int a, int b);
extern "C" void cross(int a, int b);
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

	digitalWrite(RED_LED, LOW);
	digitalWrite(RED_LED_STOP_TWO, LOW);	
	while(1){
		digitalWrite(GREEN_LED, HIGH);
		digitalWrite(RED_LED_STOP_ONE, HIGH);
		digitalWrite(RED_LED_STOP_TWO, HIGH);

		if(digitalRead(BUTTON_ONE) == HIGH){
			cross(GREEN_LED_STOP_ONE, RED_LED_STOP_ONE);	
		}

		if(digitalRead(BUTTON_TWO) == HIGH){
			cross(GREEN_LED_STOP_TWO, RED_LED_STOP_TWO);	
		}
	}
	

}

