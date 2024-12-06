function [fixedAudio, audioSpectrum, cleanSpectrum, b, a] = audioElliptical(audioData, fs, passBand, stopBand)
    % Normalize frequencies for filter design
    Wbands = ([passBand, stopBand] / 2) / (fs / 2); % Passband edge (normalized to Nyquist frequency)
    Wp = Wbands(1);
    Ws = Wbands(2);

    % Filter design parameters
    Rp = 3; % Passband ripple in dB
    Rs = 40; % Stopband attenuation in dB

    % Ensure Wp and Ws are valid for butterworth filter design
    if Wp >= 1 || Ws >= 1
        error("Normalized frequencies must be less than 1 (Nyquist frequency). Check lowCutoff or sampling frequency.");
    end

    % Determine the optimal filter order and cutoff frequency for low-pass filter
    [n, Wn] = ellipord(Wp, Ws, Rp, Rs);

    % Design the low-pass elliptic filter
    [b, a] = ellip(n, Rp, Rs, Wn, 'low');

    N = length(audioData); % Length of the signal
    [H, W] = freqz(b, a, N, fs); % Frequency response of the filter

    % Compute the FFT of the input audio signal
    audioSpectrum = fft(audioData);

    H_full = [H, flip(H(1:end))]; % Symmetrically extend the filter response

    % Apply the filter in the frequency domain
    cleanSpectrum = audioSpectrum .* H_full; % Apply filter symmetrically

    % Transform back to the time domain
    fixedAudio = real(ifft(cleanSpectrum)); % Use real() to avoid numerical artifacts
endfunction
