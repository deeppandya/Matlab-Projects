function  [train, trainCost, testCost] = Q1a(x,y,Initial,Increment,End)
    length = size(x);
    TrainSize = round(length * 0.9);
    xTrain = x(1:TrainSize,:);
    yTrain = y(1:TrainSize,:);
    xTest = x(TrainSize+1 : end, :);
    yTest = y(TrainSize+1 : end, :);
    xTrainNew = [xTrain, ones(size(xTrain,1),1)];
    xTestNew = [xTest,ones(size(xTest,1),1)];
    for lambda = Initial:Increment:End
        numOfColumnTrain = size(xTrainNew,2);
        train = (xTrainNew'*xTrainNew +lambda*eye(numOfColumnTrain))\(xTrainNew'*yTrain);
        trainCost = 0.5*(xTrainNew*train-yTrain)'*(xTrainNew*train-yTrain)+0.5*lambda*(train'*train);
        trainCost = sqrt(2*trainCost/size(xTrainNew,1));
                
        testCost = 0.5*(xTestNew*train-yTest)'*(xTestNew*train-yTest)+0.5*lambda*(train'*train);
        testCost = sqrt(2*testCost/size(xTestNew,1));

        plot(lambda,trainCost,'r.',lambda,testCost,'m.');
        hold on;
        plot(lambda,train(1),'b.',lambda, train(2), 'g.', lambda,train(3), 'y.', lambda,train(4), 'r.');
        hold on;
    end
    hold off;
    xlabel('lambda');
    ylabel('W');
