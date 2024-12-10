setup;
addpath('./imageFunctions');

% Load and generate the noise image
image = noiseImage(4);

% Known noise frequency as a fraction of the image width
noiseFrequency = 100 / size(image, 2);

% Define the filter functions as handles
filterFunctions = {@removeImageNoise, @imageButterworth, @imageChebyshev};

% Loop over the filter functions
for index = 1:length(filterFunctions)
    % Get the number of output arguments expected by the current filter function
    numOutputs = nargout(filterFunctions{index});

    % Call the filter function based on the number of outputs it returns
    switch numOutputs
        case 3
            % If the function returns 3 outputs
            [fixedImage, fftImage, fftFixedImage] = filterFunctions{index}(image, noiseFrequency);
            b = []; % No filter coefficients if not returned
            a = [];

        case 5
            % If the function returns 5 outputs
            [fixedImage, fftImage, fftFixedImage, b, a] = filterFunctions{index}(image);

        otherwise
            error('Unexpected number of outputs from filter function');
    end

    % Compute the magnitude of the FFT
    magnitudeImage = log(1 + abs(fftImage));
    magnitudeFixedImage = log(1 + abs(fftFixedImage));

    % Display the original and fixed images
    figure(index);

    % Original noisy image and its FFT

    subplot(1, 2, 1); % First plot: Fixed Image
    imshow(uint8(fixedImage), []);
    title([func2str(filterFunctions{index}), ' - Fixed Image']);

    subplot(1, 2, 2); % Second plot: FFT of Fixed Image
    imshow(magnitudeFixedImage, []);
    title([func2str(filterFunctions{index}), ' - FFT of Fixed Image']);
endfor
