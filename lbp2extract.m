% Load the query image
queryImage = imread('C:\Users\sonali\Downloads\bullman.jpg');

% Convert to grayscale if necessary
if size(queryImage, 3) == 3
    queryImage = rgb2gray(queryImage);
end

% Compute LBP features for the query image
queryFeatures = extractLBPFeatures(queryImage);

% Load the database of images with precomputed LBP features
load('lbp_coral_feature.mat', 'lbp_f1'); % Assuming you have a .mat file with LBP features of the database images

% Compute similarity between query image and each image in the database
disp(size(queryFeatures));
disp(size(lbp_f1(1, :))); % Display the size of the first row to check dimensions
similarities = zeros(size(lbp_f1, 1), 1);
for i = 1:size(lbp_f1, 1)
    similarities(i) = norm(queryFeatures - lbp_f1(i, :)); % Euclidean distance
end

% Find the index of the most similar image
[~, idx] = min(similarities);

% Assuming you have a separate cell array with filenames
% Retrieve the most similar image
retrievedImage = imread(databaseImages{idx});
