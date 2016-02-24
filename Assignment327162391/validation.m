function [accuracytest, accuracytrain] = validation(dataSet,Y,n,kMax)
accuracytest = zeros(kMax,1);
accuracytrain = zeros(kMax, 1);
for i = 1:kMax
    [accuracytest(i),accuracytrain(i)] = nFolderKNearestNeighbour(dataSet,Y, n, i);
end
plot(accuracytest,'b');
%legend();
hold on;
plot(accuracytrain,'gr');
legend('test accuracy','train accuracy');
hold off;
end