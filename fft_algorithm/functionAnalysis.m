function [totalOperations, paddingOperations] = functionAnalysis(samples, fIdx1, fIdx2)
    fs = 2500; % Taxa de amostragem em Hz
    signal = generateSignal(samples, fs);

    % Adicionar zero padding ao sinal
    signal_padded = [signal, zeros(1, samples)];

    % Calcular DFT, FFT e FFT embutida para o sinal original
    [dft_result, dftSums, dftProds] = dftO2(signal);
    [fft_result, fftSums, fftProds] = frequencyDizimationFFT(signal);

    totalOperations = [dftSums dftProds, fftSums fftProds];
    % built_in_fft = fft(signal);
    freqNormal = (-samples / 2:samples / 2 - 1) * (fs / samples);

    %% Figura 1: Resultados para o sinal original
    figure(fIdx1);

    % 1. Sinal original no tempo
    subplot(3, 1, 1);
    plot(1:samples, signal);
    title('Sinal Original (Tempo)');
    xlabel('Amostras');
    ylabel('Amplitude');

    % 2. DFT do sinal original
    subplot(3, 1, 2);
    stem(freqNormal, abs(fftshift(dft_result)), 'r', 'filled');
    title('Espectro DFT (Sinal Original)');
    xlabel('Índice de Frequência');
    ylabel('Magnitude');

    % 3. FFT embutida do sinal original
    subplot(3, 1, 3);
    stem(freqNormal, abs(fftshift(fft_result)), 'b', 'filled');
    title('Espectro FFT (Sinal Original)');
    xlabel('Índice de Frequência');
    ylabel('Magnitude');

    % Calcular DFT, FFT e FFT embutida para o sinal com zero padding
    [dft_result_padded, pDFTSums, pDFTProds] = dftO2(signal_padded);
    [fft_result_padded, pFFTSums, pFFTProds] = frequencyDizimationFFT(signal_padded);
    % built_in_fft_padded = fft(signal_padded);
    paddingOperations = [pDFTSums pDFTProds, pFFTSums pFFTProds];

    freqPadded = (-samples:samples - 1) * (fs / (samples * 2));

    %% Figura 2: Resultados para o sinal com zero padding
    figure(fIdx2);
    % 1. Sinal com zero padding no tempo
    subplot(3, 1, 1);
    plot(1:samples * 2, signal_padded);
    title('Sinal com 0s à esquerda (Tempo)');
    xlabel('Amostras');
    ylabel('Amplitude');

    % 5. DFT do sinal com zero padding
    subplot(3, 1, 2);
    stem(freqPadded, abs(fftshift(dft_result_padded)), 'r', 'filled');
    title('Espectro DFT (com 0s à esquerda)');
    xlabel('Índice de Frequência');
    ylabel('Magnitude');

    % 6. FFT embutida do sinal com zero padding
    subplot(3, 1, 3);
    stem(freqPadded, abs(fftshift(fft_result_padded)), 'b', 'filled');
    title('Espectro FFT (com 0s à esquerda)');
    xlabel('Índice de Frequência');
    ylabel('Magnitude');
endfunction
