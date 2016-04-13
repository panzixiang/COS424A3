false = 0;
falsepred = 0;
for i = 1:10000
    if testTriplets(i,3)==0
        false = false+1;
        if allprobtest(i,3)==1
            falsepred = falsepred+1;
        end
    end
end

disp(falsepred)
disp(falsepred/false)