function fixedImage = removeImageNoiseDirect(noisyImage, noiseFrequency)
    % Convert the image to double for processing
    fn = double(noisyImage);

    % Get the size of the image
    [N, M] = size(fn);

    % Preallocate the output image
    fixedImage = zeros(N, M);

    % Frequency index for the noise frequency
    freqIndex = round(noiseFrequency * M);

    % Process each row of the image
    for row = 1:N
        % Compute the Fourier Transform of the row
        rowSpectrum = fft(fn(row, :));

        % Eliminate the noise frequency (and its symmetric counterpart)
        rowSpectrum(freqIndex + 1) = 0; % Positive frequency
        rowSpectrum(M - freqIndex + 1) = 0; % Negative frequency

        % Reconstruct the row using the inverse Fourier Transform
        fixedImage(row, :) = real(ifft(rowSpectrum));
    end

    % Normalize the image to its original range
    fixedImage = fixedImage - min(fixedImage(:));
    fixedImage = fixedImage / max(fixedImage(:)) * 255;

endfunction
