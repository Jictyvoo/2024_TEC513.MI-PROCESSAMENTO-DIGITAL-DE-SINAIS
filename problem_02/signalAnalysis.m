function [] = signalAnalysis(xn, fs)
    % Parameters and FFT computation
    n = length(xn);
    y = fft(xn)/n;
    y0 = fftshift(y); % Shift zero-frequency component to the center
    f0 = (-n / 2:n / 2 - 1) * (fs / n); % Zero-centered frequency range
    power0 = abs(y0); % Zero-centered power (magnitude squared)
    angle0 = angle(y0); % Zero-centered phase angle

    % Create subplots

    % Subplot 1: Magnitude of FFT (Power Spectrum)
    subplot(3, 1, 1);
    plot(f0, power0);
    xlabel('Frequency (Hz)');
    ylabel('Power');
    title('Power Spectrum');

    % Subplot 2: Phase of FFT (Angle)
    subplot(3, 1, 2);
    
    omegaFrequency = f0 / (2*pi);
    plot(omegaFrequency, angle0);
    xlabel('Frequency (rad/s)');
    ylabel('Phase (radians)');
    title('Phase Spectrum');
end
