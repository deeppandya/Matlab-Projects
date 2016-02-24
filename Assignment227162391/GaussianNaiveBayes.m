function [W,w0]=GaussianNaiveBayes(x,y)
[features] = size(x,1);
sigma = cov(x);
c0 = x(y==0,:);
f0 = size(c0,1);
c1 = x(y==1,:);
f1 = size(c1,1);
mu0 = sum(c0,1)./f0;
mu1 = sum(c1,1)./f1;
P0 = f0/features;
P1 = f1/features;

W = (sigma)\(mu1-mu0)';
w0 = -0.5*mu1*inv(sigma)*mu1'+0.5*mu0*inv(sigma)*mu0'+log(P1/P0);



end