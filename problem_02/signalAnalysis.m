function [] = signalAnalysis(xn, fs, originalFreq)
    % Parameters and FFT computation
    n = length(xn);
    y = fft(xn)/n;
    y0 = fftshift(y); % Shift zero-frequency component to the center
    f0 = (-n / 2:n / 2 - 1) * (fs / n); % Zero-centered frequency range
    power0 = abs(y0); % Zero-centered power (magnitude squared)
    angle0 = angle(y0); % Zero-centered phase angle

    % Create subplots

    % Subplot 1: Magnitude of FFT (Power Spectrum)
    originalFreq = originalFreq*1.8;
    subplot(2, 1, 1);
    plot(f0, power0), axis([ -originalFreq originalFreq min(y0) max(y) ]);
    xlabel('Frequency (Hz)');
    ylabel('Power');
    title('Power Spectrum');

    % Subplot 2: Phase of FFT (Angle)
    subplot(2, 1, 2);
    
    omegaFrequency = f0 / (2*pi);
    plot(omegaFrequency, angle0);
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    title('Phase Spectrum');
end
