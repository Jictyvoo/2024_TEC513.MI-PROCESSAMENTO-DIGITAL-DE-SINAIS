[xt, fc, phi, x, t] = signal(2, 10, 3000);

discoverFrequency = @(t) (length(t) >= 2) * (1 / abs(t(2) - t(1))) + (length(t) < 2) * 0;
Fs = discoverFrequency(t) / 2; % amostras por segundo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtragem IDEAL
%
[impulse_train, yt, f, Yjw] = idealModulation(xt, t, Fs);
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, Fs);

# PLOTS
plotSamplingResults('Trem de Impulsos', t, xt, impulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtragem NATURAL
%
Fs = Fs / 4;
[pulse_train, yt, f, Yjw] = naturalModulation(xt, t, Fs);
# FILTRANDO O SINAL para reconstrução
[Yjw_filtered, yt_reconstructed] = applyLowPassFilter(Yjw, f, Fs);

# PLOTS
plotSamplingResults('Trem de Pulsos', t, xt, pulse_train, yt, f, Yjw, Yjw_filtered, yt_reconstructed)
