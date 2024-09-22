%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TEC430-PDS-UEFS2024.2
%Problema 01
%Arquivo para validação de consultoria
%Gerador áudio file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Função: [xt,fc,phi,t]=sinal(tempo,fcmin,fcmax)

% Variáveis de entrada
% tempo <= duração do sinal gerado em segundos
% fcmin <= conponente de frequência mínimo em Hz
% fcmax <= conponente de frequência máximo em Hz

% Variáveis de saída
% xt <= é o sinal gerado
% fc <= é o frame das frequências geradas
% phi <= é o frame de fases usados
% t <= é o dominio em segundos

% Exemplo: para gerar!!!!!

% [xt,fc,phi,t]=sinal(2,10,3000);

function [xt, fc, phi, t] = signal(tempo, fcmin, fcmax)% temo em segundos
    % Definições no tempo:
    Fs = 8000; % amostras por segundo
    dt = 1 / Fs; % segundos por amostras
    StopTime = tempo; % intervalo de duração dos sinais em segundos
    t = 0:dt:StopTime - dt; % segundos

    % Ondas senoidais:
    interval = 100; % intervalos em Hz entre sinais gerados
    fc = fcmin:interval:fcmax; % fcmin>0 Hz e fcmax<4000 Hz
    phi = 0:(pi / 2) / length(fc):pi / 2;
    A = 0.5 * rand(1, length(fc)); % Amplitudes dos sinais limitados em 0,5 e aleatórios
    for i = 1:length(fc)
        for j = 1:length(t)
            x(i, j) = A(i) * cos(2 * pi * fc(i) * t(j) + phi(i));
        end
    end
    %
    %
    xt = sum(x, 1);
    length(xt);
    % Graficando
    % Domínio do tempo
    figure(1);
    subplot(3, 1, 1);
    plot(t(1, 1:200), x(1, 1:200), 'r', t(1, 1:200), x(2, 1:200), 'g', t(1, 1:200), x(10, 1:200), 'm'); grid on;
    xlabel('Tempo  $t$(s)', 'interpreter', 'latex');
    ylabel('Amplitude');
    title('Sinais $x_{1}(t)$, $x_{2}(t)$, $x_{10}(t)$', 'interpreter', 'latex');

    subplot(3, 1, 2);
    plot(t, xt, 'b'); grid on;
    xlabel('Tempo  $t$(s)', 'interpreter', 'latex');
    ylabel('Amplitude');
    title('Sinal de entrada $x_{c}(t)$', 'interpreter', 'latex');

    % Domínio da frequência
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

    % Som
    %sound(xt,Fs);
end
