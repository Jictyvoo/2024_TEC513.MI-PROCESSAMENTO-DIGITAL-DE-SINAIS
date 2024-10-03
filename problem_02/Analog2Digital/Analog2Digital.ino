// Expose Espressif SDK functionality - wrapped in ifdef so that it still
// compiles on other platforms
#ifdef ESP8266
    extern "C" {
        #include "user_interface.h"
    }
    ADC_MODE(ADC_TOUT);
#endif


// Define constants for the GPIO pins
struct GPIOPins {
  const int sensor = A0;   // select the input pin for the potentiometer
  const int led = 13;      // select the pin for the LED
};

struct SamplingParams {
  const uint samplingFrequency = 1; // Values in Hz
  const uint maxReadValue = 1024;   // Value in ADC units (for ESP8266)
  const float maxVoltage = 3.3;     // Max ADC voltage
};

const GPIOPins gpio;  // Create an instance of the GPIOPins struct
const SamplingParams params; // Create sampling params const

typedef unsigned long int Duration;

struct TimeController {
  const Duration microsecond = 1;
  const Duration milisecond = 1000;
  const Duration second = 1000 * 1000;
  Duration lastCycleTime;
};

TimeController ctrlTime;
Duration samplingInterval = ctrlTime.second;
uint16_t sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  // Declare all OUTPUT pins
  pinMode(gpio.led, OUTPUT);

  samplingInterval = ctrlTime.second / params.samplingFrequency;
  ctrlTime.lastCycleTime = micros();
  // Initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

void loop() {
  Duration currentTime = micros();
  if (currentTime - ctrlTime.lastCycleTime < samplingInterval) {
    return;
  }

  digitalWrite(gpio.led, HIGH);

  // Read the ADC value directly from the hardware register
  sensorValue = system_adc_read();
  float voltage = (sensorValue * params.maxVoltage) / params.maxReadValue;
  Serial.println(voltage);

  ctrlTime.lastCycleTime = currentTime;
}
