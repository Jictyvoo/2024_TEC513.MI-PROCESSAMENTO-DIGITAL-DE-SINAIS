// frequency.h
#ifndef SAMPLING_FREQUENCY_HPP
#define SAMPLING_FREQUENCY_HPP


// Enum to represent sampling frequency labels
enum SamplingFrequency {
  FREQ_125KHZ,  // 125000 Hz, OCR1A = 15 for 8x prescaler
  FREQ_50KHZ,   // 50000 Hz, OCR1A = 39 for 8x prescaler
  FREQ_20KHZ,   // 20000 Hz, OCR1A = 99 for 8x prescaler
  FREQ_10KHZ,   // 10000 Hz, OCR1A = 199 for 8x prescaler
  FREQ_5KHZ,    // 5000 Hz, OCR1A = 399 for 8x prescaler
  FREQ_4KHZ,    // 4000 Hz, OCR1A = 499 for 8x prescaler
  FREQ_2KHZ     // 2000 Hz, OCR1A = 999 for 8x prescaler
};

// Struct to hold OCR1A value and corresponding frequency in Hertz
struct FrequencyInfo {
  unsigned int registerValue;   // Register value
  unsigned int frequencyHz;  // Frequency in Hertz
};

// Array of FrequencyInfo, indexed by SamplingFrequency
const FrequencyInfo frequencyTable[] = {
  { 15, 125000 },  // FREQ_125KHZ
  { 39, 50000 },   // FREQ_50KHZ
  { 99, 20000 },   // FREQ_20KHZ
  { 199, 10000 },  // FREQ_10KHZ
  { 399, 5000 },   // FREQ_5KHZ
  { 499, 4000 },   // FREQ_4KHZ
  { 999, 2000 }    // FREQ_2KHZ
};

// Macro to access FrequencyInfo based on SamplingFrequency enum
#define GET_FREQUENCY_INFO(freq) (frequencyTable[freq])


#endif  // SAMPLING_FREQUENCY_HPP
