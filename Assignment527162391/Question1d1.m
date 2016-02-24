function output = Question1d1()

mean = [5,20];
sigma = [10,2;2,5];
a = [-10:0.05:10];
r = mvnrnd(mean, sigma, 200);

r1 = [r(:,1),1000*r(:,2)];

r1_b = bsxfun(@minus, r1, sum(r1)/size(r1,1));
x1_b = cov(r1_b);
[u1_b,sig1_b,v1_b] = svd(x1_b);

b1 = u1_b(2,1)/u1_b(1,1)*a(100:300);
c1 = u1_b(2,2)/u1_b(1,2)*a(100:300);
figure,plot(r1(:,1),r1(:,2),'.',r1_b(:,1),r1_b(:,2),'r.',a(100:300),b1,'b-',a(100:300),c1,'g-');
title('Translation after scaling');
end

