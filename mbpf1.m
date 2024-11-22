clear all;
close all;
load Average_PR.mat
num_rows = size(avg_pre, 1);
f_score = zeros(num_rows, 1); % Preallocate space for F-scores

for i = 1:num_rows
    %avg_pre = avg_pre(i, 1); % Assuming avg_pre is in the first column
    %avg_rec = avg_pre(i, 2); % Assuming avg_rec is in the second column
    f_score(i,1) = 2 * (avg_pre(i,1) * avg_rec(i,1)) / (avg_pre(i,1) + avg_rec(i,1));
end
