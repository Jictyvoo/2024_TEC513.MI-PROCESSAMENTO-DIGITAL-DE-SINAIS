%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEC430-PDS-UEFS2024.2
% Problem 01
% Consultancy validation file
% Audio file generator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Function: [xt, fc, phi, t] = signal(duration, fcmin, fcmax)

% Input variables
% duration <= duration of the generated signal in seconds
% fcmin <= minimum frequency component in Hz
% fcmax <= maximum frequency component in Hz

% Output variables
% xt <= is the generated signal
% fc <= is the frame of generated frequencies
% phi <= is the frame of phases used
% t <= is the time domain in seconds

% Example: to generate!!!!!

% [xt, fc, phi, t] = signal(2, 10, 3000);

% temi giving in seconds
function [xt, fc, phi, x, t] = signal(timeInterval, fcmin, fcmax)
    % Definitions on time
    Fs = 8000; % amostras por segundo
    dt = 1 / Fs; % segundos por amostras
    StopTime = timeInterval; % intervalo de duracao dos sinais em segundos
    t = 0:dt:StopTime - dt; % segundos

    % Ondas senoidais:
    interval = 100; % intervalos em Hz entre sinais gerados
    fc = fcmin:interval:fcmax; % fcmin>0 Hz e fcmax<4000 Hz
    phi = 0:(pi / 2) / length(fc):pi / 2;
    A = 0.5 * rand(1, length(fc)); % Amplitudes dos sinais limitados em 0,5 e aleatorios
    for i = 1:length(fc)
        for j = 1:length(t)
            x(i, j) = A(i) * cos(2 * pi * fc(i) * t(j) + phi(i));
        end
    end
    xt = sum(x, 1);
end
