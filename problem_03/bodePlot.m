function bodePlot(figIdx, H, W)
    % Convert magnitude to dB
    epsilon = 1e-10; % To avoid log(0)
    magnitude_dB = 20 * log10(max(abs(H), epsilon));

    % Convert phase to degrees
    phase_deg = angle(H) * (180 / pi);

    % Plot the Bode plot
    figure(figIdx);

    % Magnitude plot
    subplot(2, 1, 1);
    plot(W, magnitude_dB, 'b', 'LineWidth', 1.5); % Normalize frequency to Hz
    grid on;
    title('Bode Plot - Magnitude Response');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    ylim([-100, 10]); % Adjust as needed

    % Phase plot
    subplot(2, 1, 2);
    plot(W, phase_deg, 'r', 'LineWidth', 1.5);
    grid on;
    title('Bode Plot - Phase Response');
    xlabel('Frequency (Hz)');
    ylabel('Phase (degrees)');
end
