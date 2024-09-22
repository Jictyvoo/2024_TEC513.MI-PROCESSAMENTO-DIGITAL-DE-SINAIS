function [Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, cutoff_freq)
    % FILTRANDO O SINAL
    mask = abs(f) <= cutoff_freq; % Janela do filtro passa-baixa

    % Aplicar o filtro passa-baixa à FFT do sinal amostrado
    Yjw_filtered = Yjw .* mask;

    % Transformada inversa para retornar ao domínio do tempo
    yt_reconstructed = ifft(ifftshift(Yjw_filtered));
end
