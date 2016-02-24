function [gaussianError, logisticError, gaussianErrorAvg, logisticErrorAvg] = TenFoldGaussianValidation(x,y)
featuresNum = size(x,1);
folds = floor(featuresNum/10);

gaussianError = zeros(10,1);
logisticError = zeros(10,1);

for i=0:9
   start = i*folds+1;
   stop = (i+1)*folds;

   testingX = x(start:stop,:);
   testingY = y(start:stop);
   trainingX = x;
   trainingY = y;
   trainingX(start:stop,:)=[];
   trainingY(start:stop)=[];
   
   [GaussianW, GaussianW0] = GaussianNaiveBayes(trainingX,trainingY);
   gaussianError(i+1)=getgaussianError(testingX, testingY, GaussianW, GaussianW0);
   
   LogisticW = LogisticRegression(trainingX,trainingY);
   logisticError(i+1)=getlogisticError(testingX, testingY, LogisticW); 
   
end

gaussianErrorAvg = sum(gaussianError)/10;
logisticErrorAvg = sum(logisticError)/10;

end






