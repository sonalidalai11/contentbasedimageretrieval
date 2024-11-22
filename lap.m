clear all;
close all;
for im=1:1000
    image=imread(strcat('image (',num2str(im),').jpg'));
    image=double(rgb2gray(image));
    [row, col] = size(image);

    lap = zeros(row, col); % Preallocate the output array

    for i = 3:row-2
        for j = 3:col-2
            center = image(i, j);
            n1 = image(i-1, j-1) > center;
            n2 = image(i-1, j) > center;
            n3 = image(i+1, j+1) > center;
            n4 = image(i-1, j-1) > center;
            n5 = image(i+2, j+2) > center;
            n6 = image(i+2, j+2) > center;
            n7 = image(i, j) > center;
            n8 = image(i+2, j+2) > center;
            n9 = image(i+1, j+1) > center;
            n10 = image(i-2, j) > center;
            n11 = image(i-2, j-1) > center;
            n12 = image(i-2, j-2) > center;

            % Concatenate binary values to form the local arc pattern
            lap(i, j) = n1*2^0 + n2*2^1 + n3*2^2 + n4*2^3 + n5*2^4 + n6*2^5 + n7*2^6 + n8*2^7 + n9*2^8 + n10*2^9 + n11*2^10 + n12*2^11;
        end
    end

    figure(1), imshow(uint8(lap)); % Display local arc pattern
    [counts, binLocations] = imhist(uint8(lap)); 
end

