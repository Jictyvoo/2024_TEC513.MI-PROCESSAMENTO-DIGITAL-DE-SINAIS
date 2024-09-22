function [Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, cutoff_freq)
    % FILTRANDO O SINAL

    % Definindo a máscara do filtro passa-baixa com suavização
    mask = abs(f) <= cutoff_freq; % Mantém frequências dentro da faixa de corte
    % Criação de uma janela de suavização usando a função Hamming
    window_size = length(mask);
    hamming_window = hamming(window_size)';
    hamming_window = hamming_window / max(hamming_window); % Normaliza a janela Hamming
    mask = mask .* hamming_window; % Aplica a janela Hamming para suavizar a transição

    % Aplicar o filtro passa-baixa à FFT do sinal amostrado
    Yjw_filtered = Yjw .* mask;

    % Transformada inversa para retornar ao domínio do tempo
    yt_reconstructed = real(ifft(ifftshift(Yjw_filtered))); % Garantir que o resultado seja real
end
