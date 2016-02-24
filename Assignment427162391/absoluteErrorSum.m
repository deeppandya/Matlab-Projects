function error = absoluteErrorSum(point, pointVector)
error = 0;
sampleNum = size(pointVector,1);
for i = 1:sampleNum
    error = error + sum(abs(pointVector(i,:)-point)); 
end
error = error/1000000;
end