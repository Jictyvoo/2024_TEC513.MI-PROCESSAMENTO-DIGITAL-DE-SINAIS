setup;
addpath('./audioFunctions');

[audioData, Fs] = audioread('assets/noise_signal.wav');

% Extract the first 200ms of the audio as noise spectrum
[_, noiseSpectrum] = extractAudioNoise(audioData, Fs);
[noiseCutFreq, freqAxis] = checkMinimumSpectrumFrequency(noiseSpectrum, Fs);

% [fixedAudio, audioSpectrum, noiseSpectrum, cleanSpectrum] = removeAudioNoise(audioData, Fs);
passBand = 1000; % in Hz
stopBand = 2000; % in Hz
%[fixedAudio, audioSpectrum, cleanSpectrum, b, a] = audioButterworth(audioData, Fs, passBand, stopBand);
[fixedAudio, audioSpectrum, cleanSpectrum, b, a] = audioElliptical(audioData, Fs, passBand, stopBand);
bodePlot(5, b, a);

% Plot the original and cleaned spectrums
figure(2);

subplot(3, 1, 1);
plot(freqAxis, abs(fftshift(audioSpectrum)));
title('Original Audio Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(3, 1, 2);
plot(freqAxis, real(fftshift(noiseSpectrum)));
title('Noise Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(3, 1, 3);
plot(freqAxis, abs(fftshift(cleanSpectrum)));
title('Fixed Audio Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

sound(fixedAudio, Fs);
