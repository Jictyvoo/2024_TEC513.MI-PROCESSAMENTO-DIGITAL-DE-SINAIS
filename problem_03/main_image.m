setup;
addpath('./imageFunctions');

image = noiseImage(3);

% Known noise frequency as a fraction of the image width
noiseFrequency = 100 / size(image, 2);

% Remove noise from the image
[fixedImage, fftImage, fftFixedImage, b, a] = imageButterworth(image, noiseFrequency);
[fixedImage, fftImage, fftFixedImage, b, a] = imageChebyshev(image, noiseFrequency);
%[fixedImage, fftImage, fftFixedImage] = removeImageNoise(image,noiseFrequency);

% Compute the magnitude of the FFT
magnitudeImage = log(1 + abs(fftImage));
magnitudeFixedImage = log(1 + abs(fftFixedImage));

% Display the original and fixed images
figure(1);

% Original noisy image and its FFT
subplot(2, 2, 1);
imshow(image, []);
title('Noisy Image');

subplot(2, 2, 2);
imshow(magnitudeImage, []);
title('FFT of Noisy Image');

% Fixed image and its FFT
subplot(2, 2, 3);
imshow(uint8(fixedImage), []);
title('Fixed Image');

subplot(2, 2, 4);
imshow(magnitudeFixedImage, []);
title('FFT of Fixed Image');
