function [] = signalAnalysis(xn, fs)
    n = length(xn);
    y = fft(xn);
    y0 = fftshift(y); % shift y values
    f0 = (-n / 2:n / 2 - 1) * (fs / n); % 0-centered frequency range
    power0 = abs(y0).^2 / n; % 0-centered power

    plot(f0, power0)
    xlabel('Frequency')
    ylabel('Power')
endfunction
