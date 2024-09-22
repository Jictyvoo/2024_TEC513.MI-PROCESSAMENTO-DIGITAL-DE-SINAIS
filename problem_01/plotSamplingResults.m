function plotSamplingResults(t, xt, train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)
    % PLOTS
    plt_rows = 3;
    plt_cols = 2;

    % 4. FFT do sinal PAM
    subplot(plt_rows, plt_cols, 4), plot(f, abs(Yjw));
    title('FFT do sinal PAM');
    xlabel('Frequência (Hz)');
    ylabel('Magnitude');

    % 5. Filtro de frequências
    subplot(plt_rows, plt_cols, 5), plot(f, abs(Yjw_filtered));
    title('Frequências filtradas');
    xlabel('Frequência (Hz)');
    ylabel('Magnitude');

    % 6. Sinal reconstruído
    subplot(plt_rows, plt_cols, 6), plot(t, real(yt_reconstructed)); % Usando real() para evitar partes imaginárias
    axis([0 5e-3 -5 5]);
    title('Sinal reconstruído');
    xlabel('Tempo (t)');
    ylabel('Magnitude');
end
