```octave
function [Xjw, sumInteractions, prodInteractions] = frequencyDizimationFFT(x)
    % Input:
    %   x - Sinal de Entrada (vetor)
    % Output:
    %   Xjw - FFT do sinal de entrada

    N = length(x); % Tamanho do sinal de entrada

    % Caso base da recursao
    if N == 1
        Xjw = x;
        sumInteractions = 0;
        prodInteractions = 0;
        return;
    end

    % Divide o sinal de origem entre partes impares e partes pares
    x_even = x(1:2:end);
    x_odd = x(2:2:end);

    % Executa a funcao da FFT de forma recursiva nas partes impares e pares
    [X_even, evenSums, evenProds] = frequencyDizimationFFT(x_even);
    [X_odd, oddSums, oddProds] = frequencyDizimationFFT(x_odd);

    % Salva o valor da quantidade de somas e multiplicacoes realizadas
    sumInteractions = evenSums + oddSums;
    prodInteractions = evenProds + oddProds;

    % Executa a funcao para calcular o valor final da FFT
    Xjw = zeros(1, N);
    for k = 1:(N / 2)
        expValue = exp(-j * 2 * pi * (k - 1) / N);
        expValue *= X_odd(k);
        prodInteractions += 1;

        Xjw(k) = X_even(k) + expValue;
        Xjw(k + N / 2) = X_even(k) - expValue;
        sumInteractions += 2;
    end
end
```
