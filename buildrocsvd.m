testsvd = zeros(2,10000);
predictions = testTriplets;
for i = 1:10000
    predictions(i,3) = dot(coeff(predictions(i,1),:),V(:,predictions(i,2)));
end
for i =1:10000
    testsvd(2,i) = predictions(i,3);
    testsvd(1,i) = 1- predictions(i,3);
end

%plotroc(target,testsvd);
%legend('0','1');