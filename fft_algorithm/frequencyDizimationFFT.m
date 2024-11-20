function X = frequencyDizimationFFT(x)
    % Input:
    %   x - Input signal (vector)
    % Output:
    %   X - FFT of the input signal

    N = length(x); % Length of the input signal

    % Base case: If the signal length is 1, the FFT is the signal itself
    if N == 1
        X = x;
        return;
    end

    % Ensure the input length is a power of 2 (zero-padding if necessary)
    if mod(N, 2) ~= 0
        error('Input length must be a power of 2.');
    end

    % Split the signal into even and odd indexed parts
    x_even = x(1:2:end);
    x_odd = x(2:2:end);

    % Recursively compute the FFT of the even and odd parts
    X_even = frequencyDizimationFFT(x_even);
    X_odd = frequencyDizimationFFT(x_odd);

    % Combine the results
    X = zeros(1, N);
    for k = 1:(N / 2)
        twiddle = exp(-j * 2 * pi * (k - 1) / N);
        X(k) = X_even(k) + twiddle * X_odd(k);
        X(k + N / 2) = X_even(k) - twiddle * X_odd(k);
    end
end
