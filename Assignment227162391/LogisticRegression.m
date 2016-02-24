function W=LogisticRegression(x, y)
    features = size(x,2);
    W = zeros(features+1,1);
for i=1:20
    dev1 = firstDeviation(x, W, y);
    dev2 = secondDeviation(x, W, y);
    ratio = dev2\dev1;
    W = W - ratio;
end
end

function dev1 = firstDeviation(x, W, y)
i = size(y,1);
x = [ones(size(x,1),1),x];
hx = sigmoid(x,W);
dev1 = 1/i*((hx-y)'*x)';
end

function dev2 = secondDeviation(x, W, y)
x = [ones(size(x,1),1),x];
i = size(x,2);
k = size(y,1);
dev2 = zeros(i, i);
hx = sigmoid(x,W);
for j=1:size(x,1)
    dev2 = dev2 + ((1-hx(j))*hx(j))*x(j,:)'*x(j,:);
end
dev2 = 1/k*dev2;
end


function hx = sigmoid(x, W)
hx = 1./(1+exp(-x*W));
end
