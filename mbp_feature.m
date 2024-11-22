
clear all;
close all;
for im=1:1000
image=imread(strcat('image (',num2str(im),').jpg'));
%image=double(rgb2gray(image));
image=(rgb2gray(image));
[row, col] = size(image);
mbp = zeros(row, col); % Preallocate the output array

for i = 2:row-1
    for j = 2:col-3
        med= (image(i-1, j-1)+image(i-1, j)+image(i-1, j+1)+image(i, j+1)+image(i+1, j+1)+image(i+1, j)+image(i+1, j-1)+image(i, j-1)+image(i, j))/9;
        n1 = image(i-1, j-1) > med;
        n2 = image(i-1, j) > med;
        n3 = image(i-1, j+1) > med;
        n4 = image(i, j+1) > med;
        n5 = image(i+1, j+1) > med;
        n6 = image(i+1, j) > med;
        n7 = image(i+1, j-1) > med;
        n8 = image(i, j-1) > med;
        % n9 is the center pixel itself, no need to calculate it again
        mbp(i, j) = n1 * 1 + n2 * 2 + n3 * 4 + n4 * 8 + n5 * 16 + n6 * 32 + n7 * 64 + n8 * 128;
    end
end

% Display the result properly
mbp = uint8(mbp); % Convert to uint8 for proper display

[counts, binLocations] = imhist(uint8(mbp));
mbp_f(im,:)=counts';
mbp_f1(im,:)=mbp_f(im,:)/(row * col);
im

save('mbp_coral_feature.mat', 'mbp_f1');
end