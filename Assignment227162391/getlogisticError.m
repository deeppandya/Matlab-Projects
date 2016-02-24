function error = getlogisticError(x,y,W)
featureCount = size(x,1);
error = 0;
for i=1:featureCount 
   xi = [1,x(i,:)];
   prob = sigmoid(xi,W); 
   error = error-y(i)*log(prob)-(1-y(i))*log(1-prob);
end
error = 1/featureCount*error;
end