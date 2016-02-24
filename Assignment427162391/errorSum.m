function error = errorSum(point, pointVector)
error = 0;
sampleNum = size(pointVector,1);
for i = 1:sampleNum    
    error = error + euclideanDistance(point, pointVector(i,:)); 
end
end