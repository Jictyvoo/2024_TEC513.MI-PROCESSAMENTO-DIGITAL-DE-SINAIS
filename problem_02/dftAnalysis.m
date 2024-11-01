function [] = dftAnalysis(xn, fs)
    % Parameters for DFT
    n = length(xn);
    k = 0:n - 1; % Frequency index
    y = zeros(1, n); % Initialize the DFT output

    % DFT computation (manual summation)
    for m = 1:n
        y(m) = sum(xn .* exp(-j * 2 * pi * (m - 1) * k / n));
    end

    % Shifted DFT results
    y0 = fftshift(y); % Shift zero-frequency component to the center
    f0 = (-n / 2:n / 2 - 1) * (fs / n); % Zero-centered frequency range
    power0 = abs(y0).^2 / n; % Zero-centered power (magnitude squared)
    angle0 = angle(y0); % Zero-centered phase angle

    % Periodic Spectrum
    periodic_f = [-3 * n / 2:n / 2 - 1] * (fs / n); % Extended frequency range
    periodic_power = repmat(power0, 1, 3); % Replicate power spectrum 3 times

    % Create subplots
    figure;

    % Subplot 1: Magnitude of DFT (Power Spectrum)
    subplot(3, 1, 1);
    plot(f0, power0);
    xlabel('Frequency (Hz)');
    ylabel('Power');
    title('Power Spectrum (DFT)');

    % Subplot 2: Phase of DFT (Angle)
    subplot(3, 1, 2);
    plot(f0, angle0);
    xlabel('Frequency (Hz)');
    ylabel('Phase (radians)');
    title('Phase Spectrum (DFT)');

    % Subplot 3: Periodic Spectrum
    subplot(3, 1, 3);
    plot(periodic_f, periodic_power);
    xlabel('Frequency (Hz)');
    ylabel('Power');
    title('Periodic Power Spectrum (DFT)');
end
