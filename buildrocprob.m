test = zeros(2,10000);
predictions = allprob;
for i =1:10000
    test(2,i) = predictions(i,3);
    test(1,i) = 1- predictions(i,3);
end

%plotroc(target,test);
%legend('random','test');

[X,Y] = perfcurve(target(:,1),test(:,1),1.0);
plot(X,Y)