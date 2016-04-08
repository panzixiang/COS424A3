test = zeros(2,10000);
predictions = testTriplets;
for i = 1:10000
    predictions(i,3) = dot(coeff(predictions(i,1),:),V(:,predictions(i,2)));
end
for i =1:10000
    test(2,i) = predictions(i,3);
    test(1,i) = 1- predictions(i,3);
end

plotroc(target,test);