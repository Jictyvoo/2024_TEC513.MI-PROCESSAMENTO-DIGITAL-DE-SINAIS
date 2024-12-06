function fixedImage = removeImageNoiseDirect(noisyImage, noiseFrequency)
    % Convert the image to double for processing
    fn = double(noisyImage);

    % Get the size of the image
    [N, M] = size(fn);

    % Frequency index for the noise frequency
    freqIndex = round(noiseFrequency * M);

    % Compute the 2D Fourier Transform of the image
    spectrum = fft2(fn);

    % Process the spectrum row by row
    for row = 1:N
        % Access the spectrum of the current row
        rowSpectrum = spectrum(row, :);

        % Eliminate the noise frequency (and its symmetric counterpart)
        rowSpectrum(freqIndex + 1) = 0; % Positive frequency
        rowSpectrum(M - freqIndex + 1) = 0; % Negative frequency

        % Update the spectrum with the filtered row
        spectrum(row, :) = rowSpectrum;
    end

    % Reconstruct the image using the inverse 2D Fourier Transform
    fixedImage = real(ifft2(spectrum));

    % Normalize the image to its original range
    fixedImage = fixedImage - min(fixedImage(:));
    fixedImage = fixedImage / max(fixedImage(:)) * 255;

endfunction
