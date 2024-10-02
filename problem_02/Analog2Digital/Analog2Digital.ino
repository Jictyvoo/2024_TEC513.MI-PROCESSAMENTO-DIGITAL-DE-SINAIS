// Define constants for the GPIO pins
struct GPIOPins {
  const int sensor = A0;   // select the input pin for the potentiometer
  const int led = 13;      // select the pin for the LED
};

struct SamplingParams {
  const uint samplingFrequency = 10; // Values in Hz
  const uint maxResistanceValue = 723; // Value in Ohms
  const float maxVoltage = 3.3; // Value in Volts
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
int samplingInterval = ctrlTime.second;
int sensorValue = 0;  // variable to store the value coming from the sensor

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

  // read the value from the sensor:
  sensorValue = analogRead(gpio.sensor);
  float voltage = (sensorValue * params.maxVoltage) / params.maxResistanceValue;
  Serial.println(voltage);

  ctrlTime.lastCycleTime = currentTime;
}
