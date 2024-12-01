function [freq, freqAxis] = checkMinimumSpectrumFrequency(noiseSpectrum, Fs)
    % Get the number of points in the spectrum
    n = length(noiseSpectrum);

    % Generate the frequency axis
    freqAxis = (-n / 2:n / 2 - 1) * (Fs / n);

    % Take the magnitude of the noise spectrum (in case it's complex)
    magnitudeSpectrum = abs(fftshift(noiseSpectrum));

    % Consider only the positive frequencies
    positiveFreqs = magnitudeSpectrum(n / 2 + 1:end);
    positiveFreqAxis = freqAxis(n / 2 + 1:end);

    % Compute the average magnitude of the positive frequencies
    avgMagnitude = mean(positiveFreqs);
    % Loop over the positive frequencies to find the first one above average
    for index = 1:length(positiveFreqs)
        if positiveFreqs(index) >= avgMagnitude
            freq = positiveFreqAxis(index); % Set the frequency when found
            return; % Exit loop after finding the first frequency above average
        end
    end

    return;
endfunction
