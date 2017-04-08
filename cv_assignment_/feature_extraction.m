function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.
code_book = load('codeBook.mat','idK','codeBook');

feat = zeros(1,100);
[r,c,l] = size(img);

   IMG=rgb2gray(img);
POINTS=detectSURFFeatures(IMG);
[FEATURES,VALID_POINTS]=extractFeatures(IMG,POINTS);
features_image = double(FEATURES);



for i = 1:size(features_image)
    f = features_image(i,:);
    dist = pdist2(f,code_book.codeBook,'euclidean');
    [min_dist,codebook_id] = min(dist);

feat(1,codebook_id) = feat(1,codebook_id)+1; % dummy, replace this with your algorithm
 

end

