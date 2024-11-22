clc;
clear all;
close all;

% Leitura da Imagem
Read = imread('input_img_256x256', 'tif');

f = double(Read); % Conversao da variavel Read

[N, N] = size(f);
Maximo = max(max(f));

% Calculo da Transformada de Fourier da Imagem

% Adicao de Ruido a Imagem Original

fre = 100 / N;

for I = 1:N
    for J = 1:N
        R(J, I) = 400 * sin((2 * pi * fre) * I);
    end
end

fn = f + R;

figure;
colormap(gray(Maximo));
subplot(2, 2, 1);
image(f);
title('Imagem original');

subplot(2, 2, 2);
image(fn);
title('Imagem ruidosa');
