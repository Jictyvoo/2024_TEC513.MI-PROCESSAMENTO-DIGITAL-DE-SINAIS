function [fixedAudio, audioSpectrum, noiseSpectrum, cleanSpectrum] = removeAudioNoise(audioData, fs)
    % Calculate the number of samples corresponding to 200ms
    durationMS = 200; % in milliseconds
    samples_200ms = round((durationMS / 1000) * fs);

    % Extract the first 200ms of the audio
    noiseSample = audioData(1:samples_200ms);

    % Take the spectrum of both
    noiseSpectrum = fft(noiseSample, length(audioData));
    audioSpectrum = fft(audioData);

    % Eliminate frequencies corresponding to noise
    cleanSpectrum = audioSpectrum;
    magnitudeThreshold = abs(noiseSpectrum); % Noise magnitude

    % Set frequencies below the noise threshold to zero
    cleanSpectrum(magnitudeThreshold > 120) = 0;

    % Reconstruct the audio using the inverse FFT
    fixedAudio = real(ifft(cleanSpectrum));
endfunction
