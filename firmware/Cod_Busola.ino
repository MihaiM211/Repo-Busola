#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>


#define BNO055_SAMPLERATE_DELAY_MS (50)


Adafruit_BNO055 bno = Adafruit_BNO055(55, 0x28);

void setup(void)
{
  Serial.begin(115200);
  
  if(!bno.begin())
  {
    Serial.print("Ooops, no IMU detected ... Check your wiring or I2C ADDR!");
    while(1);
  }

  delay(1000);
  bno.setExtCrystalUse(true);
}

void loop(void)
{
  sensors_event_t event;
  bno.getEvent(&event);

  Serial.println(event.orientation.x);

  delay(BNO055_SAMPLERATE_DELAY_MS);
}