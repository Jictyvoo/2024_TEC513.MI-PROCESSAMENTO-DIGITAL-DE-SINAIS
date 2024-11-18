% Example signal
signal = generateSignal(8); % Zero-padded to a length of 8
% Verify against MATLAB's built-in fft
built_in_fft = fft(signal);
% Compute FFT using jictyvooFFT
fft_result = frequencyDizimationFFT(signal);
% Display results
disp('frequencyDizimationFFT Result:');
disp(fft_result);
disp('Built-in FFT Result:');
disp(built_in_fft);
