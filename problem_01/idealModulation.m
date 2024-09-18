function [impulse_train, yt, f, Yjw] = idealModulation(xt, t, Fs)
    % Função que realiza a modulação PAM com trem de impulsos e FFT do sinal PAM
    %
    % Argumentos:
    % xt - Sinal de entrada
    % t  - Vetor de tempo
    % Fs - Frequência de amostragem
    %
    % Saídas:
    % impulse_train - Trem de impulsos (delta de Dirac ideal)
    % yt       - Sinal modulado com trem de impulsos
    % f             - Eixo de frequências
    % Yjw   - FFT do sinal PAM modulado

    % Função que retorna 1 quando t == 0, 0 caso contrário
    dirac_impulse = @(tiny_t) tiny_t == 0;

    % Trem de impulsos (delta de Dirac ideal)
    t_size = size(t);
    % Modulação PAM com trem de impulsos
    impulse_train = zeros(size(t));
    for k = min(t):1 / (2 * Fs):max(t) + 1
        impulse_train = impulse_train + dirac_impulse(t - k);
    end

    yt = xt .* impulse_train; % Modulação com trem de impulsos ideal

    N = length(yt); % Número de pontos do sinal
    f = (-N / 2:(N / 2) - 1) * (Fs / N); % Eixo de frequências (ajustado para Fs)

    Yjw = fftshift(fft(yt)); % FFT do sinal PAM com trem de impulsos
end
