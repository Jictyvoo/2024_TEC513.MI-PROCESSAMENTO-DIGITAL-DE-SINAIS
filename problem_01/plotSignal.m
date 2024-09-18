function plotSignal(x, t, xt, Fs)
    % Graficando
    % Time domain
    subplot(3, 1, 1);
    plot(t(1, 1:200), x(1, 1:200), 'r', t(1, 1:200), x(2, 1:200), 'g', t(1, 1:200), x(10, 1:200), 'm'); grid on;
    xlabel('timeInterval  $t$(s)', 'interpreter', 'latex');
    ylabel('Amplitude');
    title('Sinais $x_{1}(t)$, $x_{2}(t)$, $x_{10}(t)$', 'interpreter', 'latex');

    subplot(3, 1, 2);
    plot(t, xt, 'b'); grid on;
    xlabel('timeInterval  $t$(s)', 'interpreter', 'latex');
    ylabel('Amplitude');
    title('Sinal de entrada $x_{c}(t)$', 'interpreter', 'latex');

    % Frequency domain
    subplot(3, 1, 3);
    y = fft(xt); grid on;
    yaux = fliplr(y(1, 2:end));
    X = [yaux y];
    faixa = ceil(length(X) / 4);
    X(1, 1:faixa) = 0;
    X(1, 3 * faixa:end) = 0;
    length(X);
    omega = 0:Fs / length(y):Fs - (Fs / length(y));
    waux=-fliplr(omega(1, 2:end));
    w = [waux omega];
    length(w);
    plot(w, abs(2 * X / length(t))); grid on;
    xlabel('$f$(Hz)', 'interpreter', 'latex');
    ylabel('Magnitude');
    title('Espectro $|X_{c}(j2\pi f)|$', 'interpreter', 'latex');
end
