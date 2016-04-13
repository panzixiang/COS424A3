true = 0;
pred = 0;
for i = 1:10000
    if testTriplets(i,3)==1
        true = true+1;
        if allprobtest(i,3)==1
            pred = pred+1;
        end
    end
end

disp(true)
disp(pred)