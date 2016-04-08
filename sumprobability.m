allprob = zeros(10000,3);
tic
for i = 1:10000
    testx = toTest(i,1);
    testy = toTest(i,2);
    prob = 0;
    for j = 1:3348026
        trainx = txcopy(j,1);
        trainy = txcopy(j,2);
        trainv = txcopy(j,3);
        sep = [testx-trainx testy-trainy];
        value = 0;
        if norm(sep) < 1000
            mu = [trainx trainy];
            sigma = [trainv 0; 0 trainv];
        
            mvn = @(x,y) 1./(2 .* pi .* trainv .^2) .* exp(-1./2 .* ((x-trainx) .^ 2 ./ (trainv .^2) + (y-trainy) .^ 2 ./ (trainv .^2)));
            value = integral2(mvn, testx-0.5,testx+0.5,testy-0.5,testy+0.5);
        end
        prob = prob + value;
    end
    if mod(i,10) == 0
        disp(i)
        toc
    end
    allprob(i,:) = [testx testy prob];
end
        
