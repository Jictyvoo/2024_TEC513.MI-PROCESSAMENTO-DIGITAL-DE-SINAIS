function [fixedAudio, audioSpectrum, cleanSpectrum, b, a] = audioButterworth(audioData, fs, passBand, stopBand)
    % Normalize frequencies for filter design
    Wbands = ([passBand, stopBand]) / (fs / 2); % Passband edge (normalized to Nyquist frequency)
    Wp = Wbands(1);
    Ws = Wbands(2);

    % Filter design parameters
    Rp = 1; % Passband ripple in dB
    Rs = 40; % Stopband attenuation in dB

    % Ensure Wp and Ws are valid for butterworth filter design
    if Wp >= 1 || Ws >= 1
        error("Normalized frequencies must be less than 1 (Nyquist frequency). Check lowCutoff or sampling frequency.");
    end

    % Determine the optimal filter order and cutoff frequency
    [n, Wn] = buttord(Wp, Ws, Rp, Rs);

    % Design the low-pass Butterworth filter
    [b, a] = butter(n, Wn, 'low');

    % Apply the filter to the audio signal
    audioSpectrum = fft(audioData);
    fixedAudio = filter(b, a, audioData);

    % Recalculate the spectrum after filtering
    cleanSpectrum = fft(fixedAudio);
endfunction
