#ifndef CONSTDEFINITIONS_H
#define CONSTDEFINITIONS_H

#define CONVERT_ADC_TO_VOLTAGE(readValue, maxVoltage, maxReadValue)\
  ((readValue * maxVoltage) / maxReadValue)

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

typedef unsigned long int Duration;

struct TimeController {
    const Duration microsecond;
    const Duration milisecond;
    const Duration second;
} const timing = {1, 1e3, 1e6};

#endif // CONSTDEFINITIONS_H
