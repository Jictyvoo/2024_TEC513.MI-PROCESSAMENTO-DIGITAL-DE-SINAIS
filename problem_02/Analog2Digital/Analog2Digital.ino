// Expose Espressif SDK functionality - wrapped in ifdef so that it still
// compiles on other platforms
#ifdef ESP8266
    extern "C" {
        #include "user_interface.h"
    }
    ADC_MODE(ADC_TOUT);
#endif

#include "ConstDefinitions.h"

const GPIOPins gpio;  // Create an instance of the GPIOPins struct
const SamplingParams params; // Create sampling params const
Duration samplingInterval = timing.second;
Duration lastCycleTime;

void setup() {
  // Declare all OUTPUT pins
  pinMode(gpio.led, OUTPUT);

  samplingInterval = timing.second / params.samplingFrequency;
  lastCycleTime = system_get_time();
  // Initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

void loop() {
  Duration currentTime = system_get_time();
  if (lastCycleTime - currentTime < samplingInterval) {
    return;
  }

  lastCycleTime = currentTime;
  digitalWrite(gpio.led, HIGH);

  // Read the ADC value directly from the hardware register
  float voltage = readADC();
  Serial.println(voltage);

  // Turn off LED after sampling
  digitalWrite(gpio.led, LOW);
}
