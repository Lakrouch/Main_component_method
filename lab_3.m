clear all;
close all;
X = load('data3.txt');
Mean = mean(X);
Std = std(X);
Xn = zeros(100,8);
N = size(Xn);
N = N(1);
for i =1:100
    for j = 1:8
         Xn(i,j) = (X(i,j)-Mean(j))/Std(j);
    end;
end;
R = ((Xn)'*Xn)./(N-1);
V = [];
for j = 1:8
    for i = 1:(j-1)
        V = [V, R(i,j)];
    end;
end;
d = N * sum(V.^2);
chi_sq = 8*7/2;
[A, D] = eig(R);
%D = diag(D);
%D = sort(D, 'descend');
%D = diag(D);
%As = (zeros(8))';
%for i = 8:-1:1
%    As=[As,A(:,i)];
%end;
%for i = 1:8
%    As(:,1)=[ ];
%end
RA = R*A;
AD = A*D;
Z = Xn*A;
DXn = sum(std(Xn).^2);
DZ = sum(std(Z).^2);
I = 2;
Ds = eig(R);
Ds = sort(Ds, 'descend');
Y = sum(Ds(1:I))/sum(Ds);
ZCov = cov(Z);
scatter(Z(:,8),Z(:,7));
S = [];
for i = 1:8
    S = [S, sum(A(:,i))];
end;