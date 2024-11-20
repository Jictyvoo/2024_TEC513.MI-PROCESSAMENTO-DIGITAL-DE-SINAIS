function [Xjw, sumInteractions, prodInteractions] = dftO2(x)
    % Input:
    %   x - Sinal de Entrada (vetor)
    % Output:
    %   X - FFT do sinal de entrada

    N = length(x); % Número de amostras
    Xjw = zeros(1, N); % Inicializa o vetor de saída como zeros

    sumInteractions = 0;
    prodInteractions = 0;
    for k = 0:N - 1% Loop sobre cada frequência k
        summationResult = 0;
        for n = 0:N - 1% Loop sobre cada amostra n
            summationResult += x(n + 1) * exp((-j * 2 * pi * k * n) / N); % Soma acumulada
            sumInteractions += 1;
            prodInteractions += 1;
        end
        Xjw(k + 1) = summationResult;
    end
end
