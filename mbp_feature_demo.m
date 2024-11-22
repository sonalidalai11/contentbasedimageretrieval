
clear all;
close all;
for im=1:1000
image=imread(strcat('image (',num2str(im),').jpg'));
image=double(rgb2gray(image));
[row, col] = size(image);
mbp = zeros(row, col); % Preallocate the output array

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
        % n9 is the center pixel itself, no need to calculate it again
        mbp(i, j) = n1 * 1 + n2 * 2 + n3 * 4 + n4 * 8 + n5 * 16 + n6 * 32 + n7 * 64 + n8 * 128;
    end
end

% Display the result properly
mbp = uint8(mbp); % Convert to uint8 for proper display
%figure(1), imshow(mbp, []); % Display using [] to let MATLAB scale the image properly

[counts, binLocations] = imhist(mbp);
end