function lambda=eps_graph(X,k,eps)
% return as the first k eigenvalue
%
%
[n,~] = size(X);
A=sparse(n,n);

eps2=eps^2;
for i=1:n
    for j=(i+1):n
        if(sum((X(i,:)-X(j,:)).^2)<eps2)
            A(i,j)=1;
            A(j,i)=1;
        end
    end
end

lambda =spectral_clustering(A,k);
beep

end