function [testaccuracy,trainaccuracy] = nFolderKNearestNeighbour(dataSet,Y, n, k)
accuracyTest = zeros(n,1);
accuracyTrain = zeros(n,1);
for i = 1:n
   [accuracyTest(i),accuracyTrain(i)] = KNearestNeighbour(dataSet,Y,n,i,k);
end
testaccuracy = sum(accuracyTest)/n;
trainaccuracy = sum(accuracyTrain)/n;
end