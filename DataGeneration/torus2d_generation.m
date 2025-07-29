rng(2024);
numReps = 1000;
record   = zeros(numReps,1);

n = 8000;
r = 2;
R = 5;
d = 2;               % intrinsic dimension of torus
eps = n^(-1/(d+4));  % kernel bandwidth

parfor j = 1:numReps
    % sample angles for torus
    theta = 2*pi*rand(n,1);
    phi   = 2*pi*rand(n,1);
    
    % uniform-bias note: this is NOT surface-uniform!
    X = [(R + r*cos(phi)).*cos(theta), ...
         (R + r*cos(phi)).*sin(theta), ...
          r*sin(phi)];
    
    k = 1; 
    lambda = eps_graph(X, k, eps);
    record(j) = lambda;
    
    if mod(j,100)==0
        fprintf('Completed %d/%d\n', j, numReps);
    end
end

writematrix(record,'data_torus_8000.csv');
