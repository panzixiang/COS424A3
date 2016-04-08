mu = [0 0];
sigma = [1 0; 0 1];
figure;
[X1,X2] = meshgrid(linspace(-2,2,11)',linspace(-2,2,11)');
X = [X1(:) X2(:)];
p = mvncdf(X,mu,sigma);
surf(X1,X2,reshape(p,11,11));