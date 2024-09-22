function [pulse_train, yt, f, Yjw] = naturalModulation(xt, t, Fs)
    % Função que realiza a modulação PAM (Pulse Amplitude Modulation) com trem de impulsos
    % e a FFT (Fast Fourier Transform) do sinal modulado.
    %
    % Argumentos:
    % xt          - Sinal de entrada (vetor de amostras no tempo)
    % t           - Vetor de tempo correspondente ao sinal de entrada
    % Fs          - Frequência de amostragem do sinal
    %
    % Saídas:
    % pulse_train - Trem de pulsos usado para modulação (retângulos)
    % yt          - Sinal modulado por amplitude com o trem de impulsos (PAM)
    % f           - Eixo de frequências correspondente à FFT
    % Yjw         - FFT do sinal modulado (no domínio da frequência)

    duty = 50; % Ciclo de trabalho da portadora
    pulse_train = 0.5 * square(2 * pi * Fs * t, duty) + 0.5;

    yt = xt .* pulse_train; % Modulação com trem de impulsos ideal

    N = length(yt); % Número de pontos do sinal
    f = (-N / 2:(N / 2) - 1) * (Fs / N); % Eixo de frequências
    Yjw = fftshift(fft(yt)); % FFT do sinal PAM com trem de impulsos
end
