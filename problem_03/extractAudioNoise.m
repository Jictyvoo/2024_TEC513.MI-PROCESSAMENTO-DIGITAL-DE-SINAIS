function [noiseSample, noiseSpectrum] = extractAudioNoise(audioData, fs)
    % Calculate the number of samples corresponding to 200ms
    durationMS = 200; % in milliseconds
    samples_200ms = round((durationMS / 1000) * fs);

    % Extract the first 200ms of the audio as noise sample
    noiseSample = audioData(1:samples_200ms);

    % Take the spectrum of both
    noiseSpectrum = fft(noiseSample, length(audioData));
endfunction
