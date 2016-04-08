target = zeros(2,10000);
for i =1:1000
    if testTriplets(i,3) == 1
        target(2,i) = 1;
    else
        target(1,i) = 1;
    end
end