clear all;
close all;

for im = 1:1000
    image = imread(strcat('image (', num2str(im), ').jpg'));
    % Convert the image to grayscale
    image = rgb2gray(image);
    [row, col] = size(image);
    lbp = zeros(row, col); % Preallocate the output array

    for i = 2:row-1
        for j = 2:col-1
    center = image(i, j);
    n1 = image(i-1, j-1) > center;
    n2 = image(i-1, j) > center;
    n3 = image(i-1, j+1) > center;
    n4 = image(i, j+1) > center;
    n5 = image(i+1, j+1) > center;
    n6 = image(i+1, j) > center;
    n7 = image(i+1, j-1) > center;
    n8 = image(i, j-1) > center;
    lbp(i, j) = n1*2^0 + n2*2^1 + n3*2^2 + n4*2^3 + n5*2^4 + n6*2^5 + n7*2^6 + n8*2^7;
end
end
   %figure(1), imshow(uint8(lbp)); % Show the LBP image
    [counts, ~] = imhist(uint8(lbp));
    lbp_f(im, :) = counts';
    lbp_f1(im, :) = lbp_f(im, :) / (row * col);
    im
end

save('lbp_coral_feature.mat', 'lbp_f1');
