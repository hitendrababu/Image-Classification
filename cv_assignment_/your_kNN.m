function predict_label = your_kNN(feat)
% Output should be a fixed length vector [num of img, 1]. 
% Please do NOT change the interface.


 model=load('model.mat');
 X=model.feat_train;
 Y=model.label_train;
 Mdl=fitcknn(X,Y,'NumNeighbors',10);
 CMdl = fitcknn(X,Y,'NSMethod','exhaustive','Distance','euclidean');
 CMdl.NumNeighbors = 10;
% 
 predict_label=predict(Mdl, feat);
 %dummy. replace it with your own code

end