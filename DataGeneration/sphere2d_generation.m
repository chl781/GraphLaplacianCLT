m=1000; %number of repetition
record=zeros(m,1);

parfor j = 1:m
    n = 8000;

    % Generate points on a 2-dimensional sphere
    angle1 = rand(1,n)*2*pi;
    angle2 = acos(rand(1,n)*2 - 1);
    r = ones(1,n);
    x1 = r.*cos(angle1).*sin(angle2);
    y1 = r.*sin(angle1).*sin(angle2);
    z1 = r.*cos(angle2);
    X = [x1; y1; z1]';

    d = 2;
    k = 1;
    eps = n^(-1/(d+4));
    lambda = eps_graph(X, k, eps);

    record(j) = lambda;
    fprintf('Iteration %d done\n', j);
end

csvwrite('data/sphere_8000.csv',record)