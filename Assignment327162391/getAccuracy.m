function accuracy = getAccuracy(realY, estimateY)
accuracy = sum(realY==estimateY)/size(realY,1);
end