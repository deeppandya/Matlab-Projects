function output = Question1d2()

mean = [5,20];
sigma = [10,2;2,5];
a = [-10:0.05:10];
r = mvnrnd(mean, sigma, 200);

r1 = [r(:,1),1000*r(:,2)];

r1_b = bsxfun(@minus, r1, sum(r1)/size(r1,1));

r1_c = bsxfun(@rdivide, r1_b, std(r1_b));
x1_c = cov(r1_c);
[u1_c,sig1_c,v1_c] = svd(x1_c);

sub_a = a(100:300);
d1 = u1_c(2,1)/u1_c(1,1)*sub_a;
e1 = u1_c(2,2)/u1_c(1,2)*sub_a;

figure,plot(r1_c(:,1),r1_c(:,2),'g.',sub_a,d1,'b-',sub_a,e1,'g-');
title('Normalization after scaling');
end

