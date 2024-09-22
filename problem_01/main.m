% Primeiramente, configurar o ambiente chamando o arquivo setup.m
setup; % Isso irá chamar setup.m

max_frequency = 1000;
% Continuar com o código principal
[xt, fc, phi, t] = signal(2, 10, max_frequency);
% xt = sin(2 * pi * t);
f_max = max(fc); % Frequência máxima do sinal

Fs = (2.2 * f_max); % A frequência de amostragem é o dobro da frequência máxima para evitar aliasing
%Fs = round(Fs/max_frequency) * max_frequency * 1.1;
% SEM FILTRO
xt_filtered = xt;
% Aplicar o filtro Butterworth passa-baixa
f_cutoff = (f_max + 100) * 0.35; % A frequência de corte será a frequência máxima do sinal
%xt_filtered = butterworthFilter(xt, Fs, f_cutoff);
% Remover zeros do array phi
phi = phi(phi ~= 0);
%
% Definir o número de linhas e colunas dos gráficos
plt_rows = 3;
plt_cols = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODULAÇÃO IDEAL
%
[impulse_train, yt, f, Yjw] = idealModulation(xt_filtered, t, Fs);
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, f_cutoff);

% PLOTS
figure(2); % Seleciona ou cria a figura com ID 1
set(gcf, 'Name', 'Amostragem Ideal', 'NumberTitle', 'off'); % Define o nome da figura e desativa o título numérico

% 1. Sinal senoidal
subplot(plt_rows, plt_cols, 1), plot(t, xt_filtered);
title('Sinal senoidal');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 -5 5]);

% 2. Trem de Impulsos
subplot(plt_rows, plt_cols, 2), stem(t, impulse_train);
title('Trem de Impulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 0 1.5]);

% 3. PAM com Trem de Impulsos
subplot(plt_rows, plt_cols, 3), stem(t, yt);
title('PAM com Trem de Impulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 -5 5]);
% Plot dos gráficos restantes
plotSamplingResults(t, xt_filtered, impulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtragem NATURAL
%
[pulse_train, yt, f, Yjw] = naturalModulation(xt_filtered, t, Fs);
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, f_cutoff);

# PLOTS
figure(3); % Seleciona ou cria a figura com ID 1
set(gcf, 'Name', 'Amostragem Natural', 'NumberTitle', 'off'); % Define o nome da figura e desativa o título numérico

% 1. Sinal senoidal
subplot(plt_rows, plt_cols, 1), plot(t, xt_filtered);
title('Sinal senoidal');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 -5 5]);

% 2. Train
subplot(plt_rows, plt_cols, 2), plot(t, pulse_train);
stairs(t, pulse_train, 'r');
title('Trem de Pulsos (Retângulares)');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 0 1.5]), grid on;

% 3. PAM com Train
subplot(plt_rows, plt_cols, 3), plot(t, yt);
title('PAM com Trem de Pulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 -5 5]);
plotSamplingResults(t, xt_filtered, pulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtragem FLAT-TOP
%
[pulse_train, yt, f, Yjw] = flattopModulation(xt_filtered, t, Fs);
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, f_cutoff);

# PLOTS
figure(4); % Seleciona ou cria a figura com ID 1
set(gcf, 'Name', 'Amostragem Flat-Top', 'NumberTitle', 'off'); % Define o nome da figura e desativa o título numérico

% 1. Sinal senoidal
subplot(plt_rows, plt_cols, 1), plot(t, xt_filtered);
title('Sinal senoidal');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 -5 5]);


% 2. Trem de Pulsos
subplot(plt_rows, plt_cols, 2), plot(t, pulse_train);
stairs(t, pulse_train, 'r');
title('Trem de Pulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 0 1.5]);


% 3. PAM com Trem de Pulsos
subplot(plt_rows, plt_cols, 3), plot(t, yt);
title('PAM com Trem de Pulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
axis([0 5e-3 -5 5]);

plotSamplingResults(t, xt_filtered, pulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)
