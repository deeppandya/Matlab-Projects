function output = Question1b()
mean = [5,20];
sigma = [10,2;2,5];
a = [-10:0.05:10];
r = mvnrnd(mean, sigma, 200);
r_b = bsxfun(@minus, r, sum(r)/size(r,1));
x_b = cov(r_b);
[u_b,sig_b,v_b] = svd(x_b);

figure,plot(r(:,1),r(:,2),'.',r_b(:,1),r_b(:,2),'r.');
title('Translation');


b = u_b(2,1)/u_b(1,1)*a;
c = u_b(2,2)/u_b(1,2)*a(100:300);
figure,plot(r(:,1),r(:,2),'.',r_b(:,1),r_b(:,2),'r.',a,b,'b-',a(100:300),c,'g-');
title('Translation (show principle component)');
end

