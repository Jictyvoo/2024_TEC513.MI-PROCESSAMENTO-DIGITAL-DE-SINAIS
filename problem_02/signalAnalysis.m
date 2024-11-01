function [] = signalAnalysis(xn, fs)
    % Parameters and FFT computation
    n = length(xn);
    y = fft(xn);
    y0 = fftshift(y); % Shift zero-frequency component to the center
    f0 = (-n / 2:n / 2 - 1) * (fs / n); % Zero-centered frequency range
    power0 = abs(y0).^2 / n; % Zero-centered power (magnitude squared)
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
    plot(f0, angle0);
    xlabel('Frequency (Hz)');
    ylabel('Phase (radians)');
    title('Phase Spectrum');

    % Subplot 3: Periodic Spectrum

    periodic_f = [-3 * n / 2:n / 2 - 1] * (fs / n); % Extended frequency range
    periodic_power = repmat(power0, 1, 3); % Replicate power spectrum 3 times

    subplot(3, 1, 3);
    plot(periodic_f, periodic_power);
    xlabel('Frequency (Hz)');
    ylabel('Power');
    title('Periodic Power Spectrum');
end
