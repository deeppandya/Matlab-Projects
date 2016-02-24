function output = Question1c()

mean = [5,20];
sigma = [10,2;2,5];
a = [-10:0.05:10];
r = mvnrnd(mean, sigma, 200);
r_b = bsxfun(@minus, r, sum(r)/size(r,1));

r_c = bsxfun(@rdivide, r_b, std(r_b));
x_c = cov(r_c);
[u_c,sig_c,v_c] = svd(x_c);

d = u_c(2,1)/u_c(1,1)*a;
e = u_c(2,2)/u_c(1,2)*a(100:300);

figure,plot(r_b(:,1),r_b(:,2),'r.',r_c(:,1),r_c(:,2),'g.',a,d,'b-',a(100:300),e,'g-');
title('Normalization');
end

