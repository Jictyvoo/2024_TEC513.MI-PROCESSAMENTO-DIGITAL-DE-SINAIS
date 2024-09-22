function [pulse_train, yt, f, Yjw] = flattopModulation(xt, t, Fs)
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
    pulse_frequency = 1 / Fs;
    pulse_width = 0.2 * (pulse_frequency);
    pulse_time = min(t):pulse_frequency:max(t) + 1;
    pulse_train = pulstran(t, pulse_time, "rectpuls", pulse_width);

    % Modulação
    period_sample = 1; % Número de amostras por período da onda quadrada
    on_sample = round(period_sample * pulse_width / 100); % Amostras no estado "on"
    indexes = 1:period_sample:length(t); % Índices de início dos ciclos "on"

    yt = zeros(1, length(t)); % Inicializa vetor PAM
    yt(indexes) = xt(indexes); % Atribui valores do sinal modulante para o início dos pulsos
    for i = 1:length(indexes)% Preenche os ciclos "on" com o valor correspondente do sinal modulante
        yt(indexes(i):indexes(i) + on_sample - 1) = xt(indexes(i));
    end

    % FFT da modulação PAM
    N = length(yt); % Número de pontos do sinal
    f = (-N / 2:(N / 2) - 1) * (Fs / N); % Eixo de frequências (ajustado para Fs)
    Yjw = fftshift(fft(yt)); % FFT do sinal PAM com trem de pulsos
end
