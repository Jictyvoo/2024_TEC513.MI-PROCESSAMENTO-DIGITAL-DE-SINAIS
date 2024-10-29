function [] = signalAnalysis(xn, Fs)
  n = length(xn);
  Xjw = fftshift(fft(xn));
  freq = ((0:n-1) / n) * Fs; % Frequency vector
  P2 = abs(Xjw); % Two-sided spectrum
 
  % Plot the FFT
  subplot(1, 1, 1);
  plot(freq, P2);
  xlabel('Frequency (Hz)');
  title('FFT of x[n]');
endfunction
