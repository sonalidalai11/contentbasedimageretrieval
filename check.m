% Assuming you have already loaded your 1000 images into a cell array called 'images'

numImages = numel(images);
featureVectors = cell(numImages, 1);

% Extract MBP features for each image
for i = 1:numImages
    % Extract MBP features for the ith image (you need to replace this with your actual MBP feature extraction code)
    mbpFeatures = extractMBPFeatures(images{i});
    
    % Store the feature vector
    featureVectors{i} = mbpFeatures;
end

% Calculate distances between all pairs of images
distances = zeros(numImages, numImages);
for i = 1:numImages
    for j = 1:numImages
        % Calculate distance between feature vectors using a distance metric
        % You can replace 'pdist' with any distance metric you prefer
        distances(i, j) = pdist2(featureVectors{i}, featureVectors{j}, 'euclidean');
    end
end

% Now, 'distances' matrix contains the pairwise distances between all images