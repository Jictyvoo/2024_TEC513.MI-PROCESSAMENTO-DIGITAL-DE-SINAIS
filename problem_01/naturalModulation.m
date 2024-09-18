function [pulse_train, yt, f, Yjw] = naturalModulation(xt, t, Fs, pulse_width)
    % Função que realiza a modulação PAM (Pulse Amplitude Modulation) com trem de impulsos
    % e a FFT (Fast Fourier Transform) do sinal modulado.
    %
    % Argumentos:
    % xt          - Sinal de entrada (vetor de amostras no tempo)
    % t           - Vetor de tempo correspondente ao sinal de entrada
    % Fs          - Frequência de amostragem do sinal
    % pulse_width - Largura do Pulso
    %
    % Saídas:
    % pulse_train - Trem de pulsos usado para modulação (retângulos)
    % yt          - Sinal modulado por amplitude com o trem de impulsos (PAM)
    % f           - Eixo de frequências correspondente à FFT
    % Yjw         - FFT do sinal modulado (no domínio da frequência)

    pulse_frequency = Fs / 250;
    pulse_time = min(t):1 / pulse_frequency:max(t) + 1;
    pulse_train = pulstran(t, pulse_time, "rectpuls", pulse_width);

    yt = xt .* pulse_train; % Modulação com trem de impulsos ideal

    N = length(yt); % Número de pontos do sinal
    f = (-N / 2:(N / 2) - 1) * (Fs / N); % Eixo de frequências (ajustado para Fs)

    Yjw = fftshift(fft(yt)); % FFT do sinal PAM com trem de impulsos
end
