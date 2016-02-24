function output = Question1a()
mean = [5,20];
sigma = [10,2;2,5];
r = mvnrnd(mean, sigma, 200);
plot(r(:,1),r(:,2),'.');

x = cov(r);
[u,sig,v] = svd(x);

a = [-10:0.05:10];
end

