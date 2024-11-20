function [X, sumInteractions, prodInteractions] = frequencyDizimationFFT(x)
    % Input:
    %   x - Input signal (vector)
    % Output:
    %   X - FFT of the input signal

    N = length(x); % Length of the input signal

    % Base case: If the signal length is 1, the FFT is the signal itself
    if N == 1
        X = x;
        sumInteractions = 0;
        prodInteractions = 0;
        return;
    end

    % Split the signal into even and odd indexed parts
    x_even = x(1:2:end);
    x_odd = x(2:2:end);

    % Recursively compute the FFT of the even and odd parts
    [X_even, evenSums, evenProds] = frequencyDizimationFFT(x_even);
    [X_odd, oddSums, oddProds] = frequencyDizimationFFT(x_odd);

    sumInteractions = evenSums + oddSums;
    prodInteractions = evenProds + oddProds;

    % Combine the results
    X = zeros(1, N);
    for k = 1:(N / 2)
        expValue = exp(-j * 2 * pi * (k - 1) / N);
        expValue *= X_odd(k);
        prodInteractions += 1;

        X(k) = X_even(k) + expValue;
        X(k + N / 2) = X_even(k) - expValue;
        sumInteractions += 2;
    end
end
