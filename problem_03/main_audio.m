setup;
addpath('./audioFunctions');

[audioData, Fs] = audioread('assets/noise_signal.wav');

% Extract the first 200ms of the audio as noise spectrum
[~, noiseSpectrum] = extractAudioNoise(audioData, Fs);
[noiseCutFreq, freqAxis] = checkMinimumSpectrumFrequency(noiseSpectrum, Fs);

% Define filter specifications
passBand = 1000; % in Hz
stopBand = 2000; % in Hz

% Define the filter functions as handles
filterFunctions = {@audioElliptical, @audioButterworth};

figureIndexes = 0;
% Loop over the filter functions
for index = 1:length(filterFunctions)
    % Call the current filter function using function handle
    [fixedAudio, audioSpectrum, cleanSpectrum, b, a] = filterFunctions{index}(audioData, Fs, passBand, stopBand);

    % Plot the frequency response (Bode plot)
    H = tf(b, a); % Create a transfer function object from b and a
    figure(figureIndexes + 1);

    % Plot using the bode function from Octave's control package
    grid on;
    bode(H);
    title([func2str(filterFunctions{index}), ' - Bode Plot']);

    % Plot the original and cleaned spectrums
    figure(figureIndexes + 2);
    subplot(3, 1, 1);
    plot(freqAxis, abs(fftshift(audioSpectrum)));
    title([func2str(filterFunctions{index}), ' - Original Audio Spectrum']);
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
    title([func2str(filterFunctions{index}), ' - Fixed Audio Spectrum']);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    grid on;

    % Play the filtered audio
    %sound(fixedAudio, Fs);
    figureIndexes += 2;
end
