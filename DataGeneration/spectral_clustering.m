function eigenvalue = spectral_clustering(A, s)
    % spectral_clustering computes the smallest s eigenvalues of the Laplacian.
    %
    % Inputs:
    %   A - adjacency matrix (assumed symmetric)
    %   s - number of eigenvalues to compute
    %
    % Outputs:
    %   eigenvalue - smallest s eigenvalues of Laplacian (sorted ascendingly)

    % Degree matrix
    D = sparse(diag(sum(A)));

    % Unnormalized Laplacian
    L = D - A;

    % Compute smallest s+1 eigenvalues (smallest eigenvalue is usually 0)
    opts.isreal = true;
    %opts.issym = true;
    num_eig = min(s+1, size(A,1)-1); % Ensures the requested eigenvalues don't exceed matrix size
    sigma = 1e-5; % Stabalize the computation.
       s1 = eigs(L, num_eig, sigma, opts);
    
    % Sort eigenvalues in ascending order
    s1 = sort(real(s1));
    
    % Remove zero (or near-zero) eigenvalues if necessary
    tol = 1e-6;
    s1 = s1(s1 > tol);
    
    % Take first s eigenvalues after filtering
    if length(s1) < s
        warning('Less than s nonzero eigenvalues found.');
        eigenvalue = s1;
    else
        eigenvalue = s1(1:s);
    end
end
