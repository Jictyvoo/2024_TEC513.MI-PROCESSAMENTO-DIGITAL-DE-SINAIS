%Start to processing audio part
[audio_data, Fs] = audioread('assets/noise_signal.wav');
[fixedAudio, audioSpectrum, noiseSpectrum, cleanSpectrum] = removeAudioNoise(audio_data, Fs);

% Plot the original and cleaned spectrums
figure(2);

% Frequency axis (in Hz)
n = length(audioSpectrum);
freqAxis = (-n / 2:n / 2 - 1) * (Fs / n);

subplot(3, 1, 1);
plot(freqAxis, abs(fftshift(audioSpectrum)));
title('Original Audio Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(3, 1, 2);
plot(freqAxis, abs(fftshift(noiseSpectrum)));
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
