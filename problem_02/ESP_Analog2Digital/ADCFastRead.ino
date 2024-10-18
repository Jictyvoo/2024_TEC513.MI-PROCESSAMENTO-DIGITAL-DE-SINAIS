struct RuntimeSampling {
  const uint16_t num_samples = 512; // Total number of samples
  const uint8_t adc_clk_div = 16;   // ADC clock division factor
  uint16_t buffer[512];             // Buffer to store multiple ADC samples
};

RuntimeSampling rtSamp;

float readADC() {
    // buffer = system_adc_read();
    #ifdef ESP8266
        // Disable interrupts and stop the watchdog timer for uninterrupted ADC sampling
        system_soft_wdt_stop();
        ets_intr_lock();  // Disable interrupts

        // Perform fast ADC sampling and store results in buffer
        system_adc_read_fast(rtSamp.buffer, rtSamp.num_samples, rtSamp.adc_clk_div);

        ets_intr_unlock();  // Re-enable interrupts
        system_soft_wdt_restart();  // Restart the watchdog timer
    #endif
    float avgVoltage = 0.0;
    for (int i = 0; i < rtSamp.num_samples; i++) {
        avgVoltage += rtSamp.buffer[i];
    }

    return CONVERT_ADC_TO_VOLTAGE((avgVoltage / rtSamp.num_samples), params.maxVoltage, params.maxReadValue);
}
