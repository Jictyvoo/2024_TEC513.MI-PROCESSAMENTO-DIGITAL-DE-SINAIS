```octave
function Xjw = frequencyDizimationFFT(x)
    % jictyvooFFT - Computes the Fast Fourier Transform (FFT) of an input signal
    % Input:
    %   x - Input signal (vector)
    % Output:
    %   Xjw - FFT of the input signal

    N = length(x); % Length of the input signal

    % Base case
    if N == 1
        % If the signal length is 1, the FFT is the signal itself
        Xjw = x;
        return;
    end

    % Ensure the input length is a power of 2 (zero-padding if necessary)
    if mod(N, 2) ~= 0
        error('Input length must be a power of 2.');
    end
end
```
