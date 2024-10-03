#ifndef CONSTDEFINITIONS_H
#define CONSTDEFINITIONS_H


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

#endif // CONSTDEFINITIONS_H
