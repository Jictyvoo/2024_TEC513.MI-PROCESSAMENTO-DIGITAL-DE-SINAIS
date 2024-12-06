function [fixedImage, imageFreqSpectrum, cleanSpectrum, b, a] = imageButterworth(imageData, centralFrequency)
    % Normalize frequencies for filter design
    freqRange = 10;
    fs = 256;
    % Compute the frequency spectrum of the image data
    imageFreqSpectrum = fftshift(fft2(imageData));
    [Wp, Ws, Rp, Rs, radialDistance] = calculateFilterDesignParams(imageFreqSpectrum, fs);

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
