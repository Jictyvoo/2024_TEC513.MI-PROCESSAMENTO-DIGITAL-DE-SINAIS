function [pulse_train, yt, f, Yjw] = flattopModulation(xt, t, Fs, pulse_width)
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

    % Modulação PAM
    period_sam = round(Fs / pulse_frequency); % Número de amostras por período da onda quadrada
    on_samp = round(period_sam * pulse_width / 100); % Amostras no estado "on"
    ind = 1:period_sam:length(t); % Índices de início dos ciclos "on"

    yt = zeros(1, length(t)); % Inicializa vetor PAM
    yt(ind) = xt(ind); % Atribui valores do sinal modulante para o início dos pulsos
    for i = 1:length(ind)% Preenche os ciclos "on" com o valor correspondente do sinal modulante
        yt(ind(i):ind(i) + on_samp - 1) = xt(ind(i));
    end

    N = length(yt); % Número de pontos do sinal
    f = (-N / 2:(N / 2) - 1) * (Fs / N); % Eixo de frequências (ajustado para Fs)

    Yjw = fftshift(fft(yt)); % FFT do sinal PAM com trem de impulsos
end
