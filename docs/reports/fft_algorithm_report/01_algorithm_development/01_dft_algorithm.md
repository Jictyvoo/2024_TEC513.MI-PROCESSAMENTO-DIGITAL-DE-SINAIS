```octave
function [Xjw, sumInteractions, prodInteractions] = dftO2(x)
    % Input:
    %   x - Sinal de Entrada (vetor)
    % Output:
    %   Xjw - FFT do sinal de entrada

    N = length(x); % Numero de amostras
    Xjw = zeros(1, N); % Inicializa o vetor de saida como zeros

    sumInteractions = 0;
    prodInteractions = 0;
    for k = 0:N - 1% Loop sobre cada frequencia k
        summationResult = 0;
        for n = 0:N - 1% Loop sobre cada amostra n
            summationResult += x(n + 1) * exp((-j * 2 * pi * k * n) / N); % Soma acumulada
            sumInteractions += 1;
            prodInteractions += 1;
        end
        Xjw(k + 1) = summationResult;
    end
end
```

Vale ressaltar que, diferentemente da fórmula, os vetores x e Xjw são acessados incluindo um +1, devido à característica do Octave de indexação dos array começando a partir de 1.
