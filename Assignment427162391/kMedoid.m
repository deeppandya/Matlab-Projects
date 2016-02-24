
function [newCenter, nearestVec] = kMedoid(testData, K, initialCenter)

testData = testData/255;
initialCenter = initialCenter/255;
[pixelNum, featureNum] = size(testData);
newCenter = initialCenter;
nearestVec = zeros(pixelNum, 1);
newImg = zeros(size(testData));


for iter = 1:10
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

    for i = 1:K
        %This is the part that's going to be changed%
        newCluster = testData(nearestVec == i,:);
        sampleNum = size(newCluster,1);
        error = 20000000000;
        index = 1;
        
        for j = 1:sampleNum
            testError = errorSum(newCluster(j,:), newCluster); 
            if(testError<error)
                error = testError;
                index = j;
            end
        end     
        newCenter(i,:) = newCluster(index, :);
        fprintf('has generated 1 iteration');
    end
end

for i = 1:pixelNum
        distance = 20000000000;
        for j = 1:K
            temp = euclideanDistance(testData(i,:), newCenter(j,:));
            if(temp < distance)
                distance = temp;
                nearestVec(i) = j;
            end
        end   
end

creating the new image
for i=1:pixelNum
    newImg(i,:) = newCenter(nearestVec(i),:);
end

red = reSize(newImg(:,1), 516,407);
green = reSize(newImg(:,2), 516,407);
blue = reSize(newImg(:,3), 516,407);

imshow(cat(3, red, green, blue));

end


