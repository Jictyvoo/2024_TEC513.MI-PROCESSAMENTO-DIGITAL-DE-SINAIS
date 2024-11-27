function [fixedAudio, audioSpectrum, noiseSpectrum, cleanSpectrum] = removeAudioNoise(audioData, fs)
    % Calculate the number of samples corresponding to 200ms
    [noiseSample, noiseSpectrum] = extractAudioNoise(audioData, fs);
    audioSpectrum = fft(audioData);

    % Eliminate frequencies corresponding to noise
    cleanSpectrum = audioSpectrum;
    magnitudeThreshold = abs(noiseSpectrum); % Noise magnitude

    % Set frequencies below the noise threshold to zero
    cleanSpectrum(magnitudeThreshold > 120) = 0;

    % Reconstruct the audio using the inverse FFT
    fixedAudio = real(ifft(cleanSpectrum));
endfunction
