% You can change anything you want in this script.
% It is provided just for your convenience.
clear; clc; close all;

img_path = './train/';
class_num = 30;
img_per_class = 60;
img_num = class_num .* img_per_class;
feat_dim = 64;

folder_dir = dir(img_path);
% feat_train = zeros(img_num,feat_dim);
% label_train = zeros(img_num,1);
feature_descriptor = [];
descriptor = [1];
descriptor_set = 1;% features_all=[];
% features_all = zeros(img_num,100);

%  for i = 1:length(folder_dir)-2
%       img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
%      for j= 1:length(img_dir)
%     IMG = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
%     IMG_gray = rgb2gray(IMG);
%     points = detectSURFFeatures(IMG_gray);
%     [features,valid_points] = extractFeatures(IMG_gray, points);
%     
% % %    features_all((i-1)*img_per_class+j,:)= features;
% % display(features);
%     
%     end
% end
% [idx,C,sumd,D] = kmeans(features,30);
% 
d = 1;

   for i = 1:length(folder_dir)-2
   img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
       if isempty(img_dir)
             img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
       end
        
       label_train((i-1)*img_per_class+1:i*img_per_class) = i;
       
       
         for j = 1:length(img_dir)
             img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
             [R,C,l] = size(img);
             
             if(l == 3)
                 img_gray = rgb2gray(img);
             end;
                img_gray = rgb2gray(img);
             points = detectSURFFeatures(img_gray);
             [features,valid_points] = extractFeatures(img_gray,points);
            Features_Array{i,j}=features;
              fsize = size(features);
            feature_descriptor(descriptor_set:descriptor_set+fsize(1)-1,:)=features(1:fsize(1),:);
             descriptor_set = descriptor_set + fsize(1);
             descriptor = [descriptor , descriptor_set];
             end
% %        
% %        
  end
%   
  [idx , codeBook] = kmeans(feature_descriptor ,50 ,'MaxIter', 100);

% save('codeBook.mat','idK','codeBook');

% % FEATURE_ARRAY=zeros(30,60);
% % for a=1:1800
% % if isempty(Features_Array{a,1})
% %     Features_Array(a,:)=[];
% % 
% % end
% 
%     
% % end
%  [idx,C]=kmeans(feature_descriptor,100);
% 
% % A = cell2mat(Features_Array);
  
        

   




   for i = 1:length(folder_dir)-2
%      
       img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
       if isempty(img_dir)
           img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
       end
       
       label_train((i-1)*img_per_class+1:i*img_per_class) = i;
%       %      
       for j = 1:length(img_dir)        
           img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
          
           feat_train((i-1)*img_per_class+j,:) = feature_extraction(img);
       end
%      
   end
%  [idx,C,sumd,D] = kmeans(feat_train,20);
 
 
 
save('model.mat','feat_train','label_train');