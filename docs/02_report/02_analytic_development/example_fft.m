N = 100;               % Number of samples
fs = 1000;             % Sampling frequency (Hz)
f0 = 100;              % Cosine frequency (Hz)
C = 1;                 % DC Component
A = 1;                 % Cosine amplitude
n = 0:N-1;             % Discrete Time Index

% Gerando o sinal
x = C + A * cos(2 * pi * f0 * n / fs);

% Calculando a FFT do sinal
X = fftshift(fft(x));
X_mag = abs(X) / N;
f = (-N/2:N/2-1) * (fs / N);

% Plotando o sinal discretizado
figure;
subplot(2,1,1);
stem(n, x, 'filled');
xlabel('Amostras n');
ylabel('Amplitude');
title('Sinal Discretizado');
grid on;

% Plotando o espectro de magnitude
subplot(2,1,2);
plot(f, X_mag);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum x[n]');
grid on;
