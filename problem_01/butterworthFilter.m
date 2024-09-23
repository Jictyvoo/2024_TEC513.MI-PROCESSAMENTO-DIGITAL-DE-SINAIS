function [filtered_signal] = butterworthFilter(xt, Fs, order, f_cutoff)
    % Função que aplica um filtro Butterworth passa-baixa a um sinal de entrada.
    %
    % Argumentos:
    % xt       - Sinal de entrada
    % Fs       - Frequência de amostragem
    % order    - Ordem do filtro
    % f_cutoff - Frequência de corte do filtro
    %
    % Saída:
    % filtered_signal - Sinal filtrado com o filtro Butterworth

    % Normalizar a frequência de corte
    Wn = f_cutoff / (Fs / 2);

    % Design do filtro Butterworth passa-baixa
    [b, a] = butter(order, Wn, 'low');

    % Aplicar o filtro ao sinal
    filtered_signal = filter(b, a, xt);
end
