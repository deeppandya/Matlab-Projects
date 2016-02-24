function trainW = Q1c(x, y)
    length = size(x);
    TrainSize = round(length * 0.9);
    xTrain = x(1:TrainSize,:);
    yTrain = y(1:TrainSize,:);
    xTest = x(TrainSize+1:end,:);
    yTest = y(TrainSize+1:end,:);
    xTrainNew = [ones(size(xTrain,1),1), xTrain];
    xTestNew = [ones(size(xTest,1),1), xTest];
    f1 = figure;
    f2 = figure;
    for n = 1:-0.001:0
        trainW = Q1b(xTrain,yTrain,n);
        
        costTrain = (xTrainNew*trainW-yTrain)'*(xTrainNew*trainW-yTrain)+0.5*n*(trainW'*trainW);
        costTrain = sqrt(2*costTrain/size(xTrainNew,1));

        costTest = (xTestNew*trainW-yTest)'*(xTestNew*trainW-yTest)+0.5*n*(trainW'*trainW);
        costTest = sqrt(2*costTest/size(xTestNew,1));

        set(0,'CurrentFigure',f1)
        h1 = plot(n,costTrain,'b.',n,costTest,'r.');
        hold on;
        set(0,'CurrentFigure',f2)
        h2 = plot(n,trainW(1),'b.',n,trainW(2),'c.',n,trainW(3),'g.',n,trainW(4),'r.');
        hold on;
    end
    hold off;