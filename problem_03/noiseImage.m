function [fn] = noiseImage(plotFigureID)
    % Leitura da Imagem
    Read = imread('assets/image.jpg', 'tif');

    f = double(Read); % Conversao da variavel Read

    [M, N] = size(f);

    % Calculo da Transformada de Fourier da Imagem

    % Adicao de Ruido a Imagem Original

    fre = 100 / N;

    for I = 1:N
        for J = 1:M
            R(J, I) = 400 * sin((2 * pi * fre) * I);
        end
    end

    fn = f + R;

    if plotFigureID > 0
        figure(plotFigureID);
        Maximo = max(max(f));
        colormap(gray(Maximo));
        subplot(1, 2, 1);
        image(f);
        title('Imagem original');

        subplot(1, 2, 2);
        image(fn);
        title('Imagem ruidosa');
    endif
endfunction
