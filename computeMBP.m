% Function to compute Median Binary Pattern (MBP)
function mbp = computeMBP(image)
    % Convert the image to grayscale if it's RGB
    if size(image, 3) == 3
        gray_image = rgb2gray(image);
    else
        gray_image = image;
    end
    
    % Compute the median filter
    median_image = medfilt2(gray_image);
    
    % Compute the binary pattern
    binary_pattern = gray_image >= median_image;
    
    % Convert binary pattern to decimal
    mbp = bin2dec(reshape(binary_pattern.', 1, []));
end

% Load images
% Calculate distances between all pairs of images
distances = zeros(numImages, numImages);
for i = 1:numImages
    for j = 1:numImages
        % Calculate distance between feature vectors using a distance metric
        % You can replace 'pdist' with any distance metric you prefer
        distances(i, j) = pdist2(featureVectors{i}, featureVectors{j}, 'euclidean');
    end
