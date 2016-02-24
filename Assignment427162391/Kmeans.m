
function [newCenter, nearestVec,distanceIter] = Kmeans(testData, K, initialCenter)

pixelNum = size(testData,1);
newCenter = initialCenter;
nearestVec = zeros(pixelNum, 1);
newImg = zeros(size(testData));
distanceMatrixIter = zeros(pixelNum,50);
distanceIter = zeros(1,50);

for iter = 1:50
    for i = 1:pixelNum
        distance = 200000;
        for j = 1:K
            temp = sqrt(euclideanDistance(testData(i,:), newCenter(j,:)));
            if(temp < distance)
                distance = temp;
                nearestVec(i) = j;
                distanceMatrixIter(i,iter) = distance;
            end
        end   
    end

    for i = 1:K
        newCenterAllocate = testData(nearestVec == i,:);
        newCenter(i,:) = sum(newCenterAllocate,1)/sum(nearestVec==i);
    end
end

distanceIter = sum(distanceMatrixIter,1);

for i = 1:pixelNum
        distance = 200000;
        for j = 1:K
            temp = euclideanDistance(testData(i,:), newCenter(j,:));
            if(temp < distance)
                distance = temp;
                nearestVec(i) = j;  
            end
        end   
end

%creating the new image
for i=1:pixelNum
    newImg(i,:) = newCenter(nearestVec(i),:);
end

red = reSize(newImg(:,1), 516,407)/255;
green = reSize(newImg(:,2), 516,407)/255;
blue = reSize(newImg(:,3), 516,407)/255;

imshow(cat(3, red, green, blue));

end