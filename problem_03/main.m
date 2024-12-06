setup;
addpath('./imageFunctions');
addpath('./audioFunctions');

image = noiseImage(3);

% Known noise frequency as a fraction of the image width
noiseFrequency = 100 / size(image, 2);

% Remove noise from the image
%[fixedImage, fftImage, fftFixedImage, b, a] = imageButterworth(image, noiseFrequency);
[fixedImage, fftImage, fftFixedImage, b, a] = imageChebyshev(image, noiseFrequency);
%[fixedImage, fftImage, fftFixedImage] = removeImageNoise(image,noiseFrequency);

% Compute the magnitude of the FFT
magnitudeImage = log(1 + abs(fftImage));
magnitudeFixedImage = log(1 + abs(fftFixedImage));

% Display the original and fixed images
figure(1);

% Original noisy image and its FFT
subplot(2, 2, 1);
imshow(image, []);
title('Noisy Image');

subplot(2, 2, 2);
imshow(magnitudeImage, []);
title('FFT of Noisy Image');

% Fixed image and its FFT
subplot(2, 2, 3);
imshow(uint8(fixedImage), []);
title('Fixed Image');

subplot(2, 2, 4);
imshow(magnitudeFixedImage, []);
title('FFT of Fixed Image');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Start to processing audio part
[audioData, Fs] = audioread('assets/noise_signal.wav');

% Extract the first 200ms of the audio as noise spectrum
[_, noiseSpectrum] = extractAudioNoise(audioData, Fs);
[noiseCutFreq, freqAxis] = checkMinimumSpectrumFrequency(noiseSpectrum, Fs);

% [fixedAudio, audioSpectrum, noiseSpectrum, cleanSpectrum] = removeAudioNoise(audioData, Fs);
passBand = 2600; % in Hz
stopBand = noiseCutFreq; % in Hz
[fixedAudio, audioSpectrum, cleanSpectrum, b, a] = audioButterworth(audioData, Fs, passBand, stopBand);
%[fixedAudio, audioSpectrum, cleanSpectrum, b, a] = audioElliptical(audioData, Fs, passBand, stopBand);
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
