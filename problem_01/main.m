% First, set up the environment by installing/loading necessary packages
setup; % This will call setup.m

% Continue with main code
[xt, fc, phi, x, t] = signal(2, 10, 3000);

discoverFrequency = @(t) (length(t) >= 2) * (1 / abs(t(2) - t(1))) + (length(t) < 2) * 0;
Fs = discoverFrequency(t) / 2; % amostras por segundo

plt_rows = 3;
plt_cols = 2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtragem IDEAL
%
[impulse_train, yt, f, Yjw] = idealModulation(xt, t, Fs);
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, Fs);

% PLOTS
figure; % Cria uma nova figura para os gráficos

% 1. Sinal senoidal
subplot(plt_rows, plt_cols, 1);
plot(t, xt);
title('Sinal senoidal');
xlabel('Tempo (t)');
ylabel('Magnitude');

% 2. Train
subplot(plt_rows, plt_cols, 2), stem(t, impulse_train);
title('Trem de Impulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');

% 3. PAM com Train
subplot(plt_rows, plt_cols, 3), stem(t, yt);
title('PAM com Trem de Impulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
plotSamplingResults(t, xt, impulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtragem NATURAL
%
% Remove zeros from the array
phi = phi(phi != 0);
[pulse_train, yt, f, Yjw] = naturalModulation(xt, t, Fs, min(phi));
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, Fs);

# PLOTS
figure; % Cria uma nova figura para os gráficos

% 1. Sinal senoidal
subplot(plt_rows, plt_cols, 1);
plot(t, xt);
title('Sinal senoidal');
xlabel('Tempo (t)');
ylabel('Magnitude');

% 2. Train
subplot(plt_rows, plt_cols, 2), plot(t, pulse_train);
title('Trem de Pulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');

% 3. PAM com Train
subplot(plt_rows, plt_cols, 3), plot(t, yt);
title('PAM com Trem de Pulsos');
xlabel('Tempo (t)');
ylabel('Magnitude');
plotSamplingResults(t, xt, pulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)
