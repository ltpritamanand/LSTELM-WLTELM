function [X] = datanorm(X)
n = size(X,2); % input dimension
ub=1; lb=-1;
sca = zeros(n,1);
mina = zeros(n,1);
maxa = zeros(n,1);
A = zeros(n,1);
B = zeros(n,1);
for i=1:n
    mina(i) = min(X(:,i));
    maxa(i) = max(X(:,i));
    sca(i) = maxa(i) - mina(i);
end

for i=1:n
    if sca(i)
        A(i) = (ub - lb)/sca(i);
        B(i) = lb - A(i)*mina(i);
        X(:,i) = A(i)*X(:,i) + B(i);
    end
end
end