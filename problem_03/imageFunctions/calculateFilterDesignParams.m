function [Wp, Ws, Rp, Rs, radialDistance] = calculateFilterDesignParams(imageFreqSpectrum, fs)
    % Normalize frequencies for filter design
    freqRange = 10; % Frequency range for the filter design

    % Calculate the central frequency and radial distance
    [centralFrequency, radialDistance] = calculateCentralFreq(imageFreqSpectrum, fs);

    % Define stopband and passband frequencies
    stopBandFreq = [centralFrequency - freqRange, centralFrequency + freqRange];
    passBandFreq = [centralFrequency - (freqRange * 2), centralFrequency + (2 * freqRange)];

    % Normalize the passband and stopband frequencies to Nyquist frequency
    Wp = passBandFreq / (fs / 2); % Passband edge (normalized to Nyquist frequency)
    % Ensure passband frequencies are within the range [0, 1]
    Wp(Wp < 0) = 0; % Set values less than 0 to 0
    Wp(Wp > 1) = 1; % Set values greater than 1 to 1

    Ws = stopBandFreq / (fs / 2); % Stopband edge (normalized to Nyquist frequency)
    % Ensure stopband frequencies are within the range [0, 1]
    Ws(Ws < 0) = 0; % Set values less than 0 to 0
    Ws(Ws > 1) = 1; % Set values greater than 1 to 1

    % Filter design parameters
    Rp = 3; % Passband ripple in dB
    Rs = 40; % Stopband attenuation in dB
end
