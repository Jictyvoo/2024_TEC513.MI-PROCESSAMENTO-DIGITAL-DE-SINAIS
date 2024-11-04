//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//%TEC430-PDS-UEFS2024.2
//%Problema 02
//%Arquivo para teste na captura e conversão do ADC e envio dados pela USB
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#include "sampling_frequency.hpp"

const byte adcPin = 0;  // A0  <=  ATMega 2560 A0 pin for ADC0

const FrequencyInfo selectedFs = GET_FREQUENCY_INFO(FREQ_50KHZ);
const unsigned int MAX_RESULTS = 3400;  // size for store data to be sent
volatile int results[MAX_RESULTS];      // data vector
volatile unsigned int resultNumber;

// ADC complete ISR
ISR(ADC_vect) {
  if (resultNumber >= MAX_RESULTS) {
    ADCSRA = 0;  // turn off ADC
    resultNumber = 0;
  } else
    results[resultNumber++] = ADC;
}  // end of ADC_vect

EMPTY_INTERRUPT(TIMER1_COMPB_vect);

// ADC configure initialization
void ADC_init() {
  ADCSRA = bit(ADEN) | bit(ADIE) | bit(ADIF);  // turn ADC on, want interrupt on completion
  // ADCSRA |= bit (ADPS2) | bit (ADPS1) | bit (ADPS0); // Prescaler of 128  // 16MHz/128 = 125kHz the ADC reference clock
  ADCSRA |= bit(ADPS2);               // Prescaler of 16  // 16MHz/16 = 1MHz the ADC reference clock
  ADMUX = bit(REFS0) | (adcPin & 7);  // Set Voltage reference to Avcc (5v)
  ADCSRB = bit(ADTS0) | bit(ADTS2);   // Timer/Counter1 Compare Match B
  ADCSRA |= bit(ADATE);               // turn on automatic triggering
}  // Do an initial conversion

// Timer samplig configure
void timer() {
  // reset Timer 1
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;
  // TCCR1B |= bit (CS12) | bit (CS11) | bit (CS10) | bit (WGM12);  // CTC, prescaler of 8 (CSn12  CSn11 CSn10 => 0 1 0)  |  WGM12 => 1
  TCCR1B = bit(CS11) | bit(WGM12);   // CTC, prescaler of 8 (CSn12  CSn11 CSn10 => 0 1 0)  |  WGM12 => 1
  TIMSK1 = bit(OCIE1B);              // WTF?     OCIE1B => 1    Timer}/Countern, Output Compare B Match Interrupt Enable   When this bit is written to one,
                                     // and the I-flag in the Status Register is set (interrupts globally enabled), the Timer/Countern Output Compare B Match interrupt is enabled.
                                     // The corresponding Interrupt Vector (see “Interrupts” on page 101) is executed when the OCFnB Flag, located in TIFRn, is set.
  OCR1A = selectedFs.registerValue;  // (16MhZ / (8*sampling freq)-1),  if samplinf freq = 125kHz = OCR1A = 15
  OCR1B = selectedFs.registerValue;  // sampling frequency // OCR1A  39 for 50kHz sampling freq. // = 99 for 20 kHz // = 199 for 10kHz // = 399 for 5kHz // 999 for 2kHz //

  // if (16MhZ / (128*sampling freq)-1) ,  for 128 prescaler  is 124 for 1kHz
}

void sendSerial() {
  // wait for buffer to fill
  while (resultNumber < MAX_RESULTS) {
  }

  Serial.println(String(selectedFs.frequencyHz) + ":" + String(MAX_RESULTS) + ";");
  for (int i = 0; i < MAX_RESULTS; i++)
    Serial.println(results[i]);
}

// Setup and run
void setup() {
  Serial.begin(2000000);
  Serial.println();

  timer();
ADCCycle:
  ADC_init();

  // wait for buffer to fill
  sendSerial();
  goto ADCCycle;
}  // end of setup

void loop() {
}
