function error = getgaussianError(x, y, W, w0)

testingNum = size(x,1);
error = 0;
for i=1:testingNum
   prob = 1/(1+exp(-W'*x(i,:)'-w0)); 
   error = error-y(i)*log(prob)-(1-y(i))*log(1-prob);
end
error = 1/testingNum*error;
end