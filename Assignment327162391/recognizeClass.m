function estimateTestY = recognizeClass(distanceMatrix,trainY, k)

[dummySortedDistance, index] = sort(distanceMatrix,2);
kIndex = index( : , 1:k);
possibleTestY = trainY(kIndex);

estimateTestY = round(sum(possibleTestY, 2)/k);

for i = 1: size(estimateTestY,1)
    if(estimateTestY(i) == 0.5)
        estimateTestY(i) = possibleTestY(i,1);
    end
end
end