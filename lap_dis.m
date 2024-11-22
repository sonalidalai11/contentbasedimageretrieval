clear all;
close all;
load lap_coral_feature
num_images = size(lap_f1, 1);
distances = zeros(num_images, num_images);

for i = 1:num_images
    for j = 1:num_images
        distances(i, j) = sqrt(sum((lap_f1(i, :) - lap_f1(j, :)).^2));
    end
end



% Display or use the distances as needed
disp(distances);
for i=1:num_images
   [B(i,:),I(i,:)] = sort(distances(i,:),'Ascend');
end

n_i_c=100; % no of images in a class;

%Finding precision and recall

recall = zeros(1000,1);
precision = zeros(1000,1);
limit = (125/100)*25;


for image_no=1:1000;
    classes(image_no,:)=ceil(image_no/n_i_c); %found  class number for all image
   
   image_no
end



F_p=floor((125/100)*n_i_c);  % fucntion point

for i=1:F_p
    B1(:,i)=B(:,i);
    I1(:,i)=I(:,i);
    c_r(:,i)=ceil(I1(:,i)/n_i_c);  % retrievd 125 images and their clasees for 2675 images
end

%c_r store classes of retrieved image
for im=1:1000
    counter=0;
    for i=1:F_p
    if (classes(im)==c_r(im,i)) % class comparision 
        counter=counter+1;
        
    end
    end
    precision(im,1)=(counter/F_p)*100;
    recall(im,1)=(counter/n_i_c)*100;
end
sum_pre = 0;
sum_rec = 0;
avg_pre = zeros(10,1);
avg_rec = zeros(10,1);
a=1;

for i=1:100:1000
    
    for j=i:i+99
        sum_pre = sum_pre + precision(j,1);
        sum_rec = sum_rec + recall(j,1);
    end
    
    if a<=10
        
        avg_pre(a,1)= (sum_pre/100);3
               
        avg_rec(a,1) = (sum_rec/100);
        
        a=a+1;
    end
    
    sum_pre = 0;
    sum_rec = 0;
    i     
end

save('Average_PR.mat','avg_pre','avg_rec');

