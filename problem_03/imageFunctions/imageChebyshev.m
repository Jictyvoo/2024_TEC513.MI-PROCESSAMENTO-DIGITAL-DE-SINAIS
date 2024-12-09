function [fixedImage, imageFreqSpectrum, cleanSpectrum, H, W] = imageChebyshev(imageData, centralFrequency)
    % Normalize frequencies for filter design
    freqRange = 10;
    fs = 256;
    % Compute the frequency spectrum of the image data
    imageFreqSpectrum = fftshift(fft2(imageData));
    [Wp, Ws, radialDistance] = calculateFilterDesignParams(imageFreqSpectrum, fs);

    Rp = 0.1; % Passband ripple in dB
    Rs = 60; % Stopband attenuation in dB

    % Determine the optimal filter order and cutoff frequency
    [n, Wn] = cheb2ord(Wp, Ws, Rp, Rs);

    % Design the low-pass Butterworth filter
    [b, a] = cheby2(n, Rs, Wn, 'stop');

    %Apply the filter
    [N, M] = size(imageData);
    [H, W] = freqz(b, a, N); % Resposta do Butterworth
    freqNormalized = W / pi * (fs / 2); % Normalize frequencies
    H_2D = interp1(freqNormalized, abs(H), radialDistance, 'linear', 0);

    % Apply filter on the spectrum
    cleanSpectrum = imageFreqSpectrum .* H_2D;
    fixedImage = real(ifft2(fftshift(cleanSpectrum)));
endfunction
