% S is 10x10

% decompose
[U,S,V]=svds(training,10);
% multiply components
V = V.';
U = sparse(U);
V=sparse(V);
S=sparse(S);
svd_probs = U*S*V;
%V = V.';
%V=sparse(V);
%svd_probs_final = svd_probs*V;
disp('done');

% leave out probabilities outside [0,1]
%for i=[1:size(svd_probs,1)]
%    for j=[1:length(svd_probs)]
%        if (svd_probs(i,j) < 0 | svd_probs(i,j) > 1)
            
%        end
%    end
%end

% prediction

% binary prediction matrix
%predics = sparse(length(testset));

%for i=[1:size(testset,1)]
%    for j=[1:length(testset)]
%        if (svd_probs(i,j) > 0.5 & svd_probs(i,j) < 1)
%            predics(i,j)=1;
%        elseif (svd_probs(i,j) < 0 | svd_probs(i,j) > 1)
%            predics(i,j)=-1;
%        else predics(i,j) = 0;
%        end
%    end
%end

% compare to ground-truth 
%
%      
