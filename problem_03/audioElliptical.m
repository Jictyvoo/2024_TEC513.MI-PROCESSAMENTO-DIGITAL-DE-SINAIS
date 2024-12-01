function [fixedAudio, audioSpectrum, cleanSpectrum] = audioElliptical(audioData, fs, passBand, stopBand)
    % Normalize frequencies for filter design
    Wbands = [passBand , stopBand]/ (fs / 2); % Passband edge (normalized to Nyquist frequency)
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

    % Apply the low-pass filter to the audio signal (elliptical low-pass)
    audioSpectrum = fft(audioData);
    fixedAudio = filter(b, a, audioData);

    % Recalculate the spectrum after filtering
    cleanSpectrum = fft(fixedAudio);
endfunction
