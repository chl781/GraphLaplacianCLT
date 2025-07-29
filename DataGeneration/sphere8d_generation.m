nReps = 500;          % number of Monte Carlo draws
record = zeros(nReps,1);

parfor j = 1:nReps
    n = 8000;
    d = 8;            % manifold dimension
    p = d + 1;        % embedding dimension (R^{d+1})

    % uniformly sample on S^d:
    X = randn(n, p);
    X = X ./ vecnorm(X,2,2);

    k = 1;
    eps = n^(-1/(d+4)) / log(n)^(1/(d+4));

    lambda = eps_graph(X, k, eps);
    record(j) = lambda;

    fprintf('done iter %d\n', j);
end

csvwrite('data/8d_8000.csv',record);

