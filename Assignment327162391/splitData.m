function [trainSet, testSet] = splitData(originalSet, n, binIndex)

ratio = 1/n;
sampleNum = size(originalSet,1);
testingNum = floor(sampleNum*ratio);

testingStart = (binIndex-1)*testingNum + 1;
testingEnd = binIndex*testingNum;

trainSet = originalSet;
trainSet(testingStart:testingEnd,:) = [];
testSet = originalSet(testingStart:testingEnd,:);

end