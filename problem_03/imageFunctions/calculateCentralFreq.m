function [centralFrequency, radialDistance] = calculateCentralFreq(imgFFT, Fs)
    [N, M] = size(imgFFT);
    % Calcula a frequência central com base no espectro FFT
    magnitude_spectrum = abs(imgFFT); % Magnitude do espectro
    [~, idx] = max(magnitude_spectrum(:)); % Índice do pico máximo
    [row, col] = ind2sub(size(magnitude_spectrum), idx); % Coordenadas do pico
    freq_row = (row - N / 2 - 1) * Fs / N; % Frequência em relação à linha
    freq_col = (col - M / 2 - 1) * Fs / M; % Frequência em relação à coluna
    centralFrequency = sqrt(freq_row^2 + freq_col^2); % Frequência radial

    [u, v] = meshgrid(-M / 2:(M / 2 - 1), -N / 2:(N / 2 - 1));
    radialDistance = sqrt(u.^2 + v.^2); % Distância radial no espectro
end
