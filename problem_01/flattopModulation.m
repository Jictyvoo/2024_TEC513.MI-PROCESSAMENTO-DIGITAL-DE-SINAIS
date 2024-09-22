function [pulse_train, yt, f, Yjw] = flattopModulation(xt, t, Fs, pulse_width)
    % Função que realiza a amostragem flat-top com trem de impulsos retangulares
    %
    % Argumentos:
    % xt          - Sinal de entrada (vetor de amostras no tempo)
    % t           - Vetor de tempo correspondente ao sinal de entrada
    % Fs          - Frequência de amostragem do sinal
    % pulse_width - Largura do Pulso (em segundos)
    %
    % Saídas:
    % pulse_train - Trem de pulsos usado para modulação (retângulos)
    % yt          - Sinal modulado flat-top (mantém o valor constante durante o pulso)
    % f           - Eixo de frequências correspondente à FFT
    % Yjw         - FFT do sinal modulado (no domínio da frequência)

    % Frequência dos pulsos
    pulse_frequency = Fs;
    pulse_width = 0.2 * (1 / Fs);

    % Gerar trem de pulsos
    pulse_time = min(t):1 / pulse_frequency:max(t);
    pulse_train = pulstran(t, pulse_time, "rectpuls", pulse_width); % Trem de pulsos retangulares
    
    % Modulação flat-top - manter o valor constante durante o pulso
    yt = zeros(1, length(t));  % Inicializar vetor de saída
    for i = 1:length(pulse_time)-1
        % Identificar o intervalo de cada pulso
        start_idx = find(t >= pulse_time(i), 1);
        end_idx = find(t >= pulse_time(i+1), 1);
        
        if isempty(end_idx)
            end_idx = length(t); % Se o pulso for o último, ir até o final do vetor
        end
        
        % Manter o valor do sinal original durante todo o intervalo do pulso
        yt(start_idx:end_idx) = xt(start_idx);  
    end

    % FFT da modulação flat-top
    N = length(yt); 
    f = (-N / 2:(N / 2) - 1) * (Fs / N); % Eixo de frequências para a FFT
    Yjw = fftshift(fft(yt)); % Transformada rápida de Fourier (FFT)
end
