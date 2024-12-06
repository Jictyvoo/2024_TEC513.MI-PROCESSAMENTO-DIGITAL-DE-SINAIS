function [fixedImage, imageFreqSpectrum, cleanSpectrum, H, W] = imageButterworth(imageData, centralFrequency)
    % Normalize frequencies for filter design
    freqRange = 10;
    fs = 256;
    imageFreqSpectrum = fftshift(fft2(imageData));
    [centralFrequency, radialDistance] = calculateCentralFreq(imageFreqSpectrum, fs);
    stopBandFreq = [centralFrequency - freqRange, centralFrequency + freqRange];
    passBandFreq = [centralFrequency - (freqRange * 2), centralFrequency + (2 * freqRange)];

    Wp = passBandFreq / (fs / 2); % Passband edge (normalized to Nyquist frequency)
    % Ensure passband frequencies are within the range [0, 1]
    Wp(Wp < 0) = 0; % Set values less than 0 to 0
    Wp(Wp > 1) = 1; % Set values greater than 1 to 1

    Ws = stopBandFreq / (fs / 2); % Stopband edge slightly above passband edge, ensure < 1 (Nyquist limit)
    % Ensure stopband frequencies are within the range [0, 1]
    Ws(Ws < 0) = 0; % Set values less than 0 to 0
    Ws(Ws > 1) = 1; % Set values greater than 1 to 1

    % Filter design parameters
    Rp = 3; % Passband ripple in dB
    Rs = 40; % Stopband attenuation in dB

    % Determine the optimal filter order and cutoff frequency
    [n, Wn] = buttord(Wp, Ws, Rp, Rs);

    % Design the low-pass Butterworth filter
    [b, a] = butter(n, Wn, 'stop');

    %Apply the filter
    [N, M] = size(imageData);
    [H, W] = freqz(b, a, N); % Resposta do Butterworth
    freqNormalized = W / pi * (fs / 2); % Normalize frequencies
    H_butter_2D = interp1(freqNormalized, abs(H), radialDistance, 'linear', 0);

    % Apply filter on the spectrum
    cleanSpectrum = imageFreqSpectrum .* H_butter_2D;
    fixedImage = real(ifft2(fftshift(cleanSpectrum)));
endfunction
