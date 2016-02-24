function [accuracyTest,accuracyTrain] = KNN2(dataSet,Y,n,binIndex, k)

[trainSet, testSet] = splitData(dataSet, n, binIndex);
[trainY, testY] = splitData(Y, n, binIndex);
trainNum = size(trainSet, 1);
testNum = size(testSet, 1);
distanceMatrix = zeros(testNum, trainNum);
distanceMatrixTrain = zeros(trainNum, trainNum);

for i = 1:testNum
    a = testSet(i,:);
    for j = 1:trainNum
        b = trainSet(j,:);
        distanceMatrix(i,j) = euclideanDistance(a,b);
    end
end

for i = 1:trainNum
    a = trainSet(i,:);
    for j = 1:trainNum
        b = trainSet(j,:);
        distanceMatrixTrain(i,j) = euclideanDistance(a,b);
    end
end

estimateTestY = recognizeClass(distanceMatrix,trainY, k);
accuracyTest = getAccuracy(testY, estimateTestY);

estimateTestYTrain = recognizeClass(distanceMatrixTrain,trainY, k);
accuracyTrain = getAccuracy(trainY, estimateTestYTrain);
end
