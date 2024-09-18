function plotSamplingResults(train_label, t, xt, train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)
    % PLOTS
    plt_rows = 3;
    plt_cols = 2;
    figure; % Cria uma nova figura para os gráficos

    % 1. Sinal senoidal
    subplot(plt_rows, plt_cols, 1);
    plot(t, xt);
    title('Sinal senoidal');
    xlabel('Tempo (t)');
    ylabel('Magnitude');

    % 2. Train
    subplot(plt_rows, plt_cols, 2);
    stem(t, train);
    title(train_label);
    xlabel('Tempo (t)');
    ylabel('Magnitude');

    % 3. PAM com Train
    subplot(plt_rows, plt_cols, 3);
    stem(t, yt);
    title(['PAM com ' train_label]);
    xlabel('Tempo (t)');
    ylabel('Magnitude');

    % 4. FFT do sinal PAM
    subplot(plt_rows, plt_cols, 4);
    plot(f, abs(Yjw));
    title('FFT do sinal PAM');
    xlabel('Frequência (Hz)');
    ylabel('Magnitude');

    % 5. Filtro de frequências
    subplot(plt_rows, plt_cols, 5);
    plot(f, abs(Yjw_filtered));
    title('Frequências filtradas');
    xlabel('Frequência (Hz)');
    ylabel('Magnitude');

    % 6. Sinal reconstruído
    subplot(plt_rows, plt_cols, 6);
    plot(t, real(yt_reconstructed)); % Usando real() para evitar partes imaginárias
    title('Sinal reconstruído');
    xlabel('Tempo (t)');
    ylabel('Magnitude');
end
