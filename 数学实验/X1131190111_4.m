%% 矩阵
clear,clc
A=rand(3,3);
B=rand(5);
V=[1 2 3];
D=diag(V);
diag(D);
diag(V,1);
diag(V,-2);
%%
A = randi(10,6)
x = diag(A)
x1 = diag(A,-1)
A1 = diag(diag(A))
%%
clear,clc
A=hilb(3);
%%
invhilb(4)
%%
v = 1:.5:3
A = vander(v)
A = fliplr(vander(v))
%%
tic,A=sym(hilb(20));
det(A)
toc
%%
clear,clc
H=hilb(20); %数值
rank(H)
H=sym(hilb(20)); %符号
rank(H)
%%
clear,clc
A=[1 2 3;4 5 6;7 8 9];
norm(A)
norm(A,1)
norm(A,inf)
%%
v = [1 -2 3];
n = norm(v)
X = [-2 3 -1];
n = norm(X,1)
a = [0 3];
b = [-2 1];
d = norm(b-a)
S = sparse(1:25,1:25,1);
n = norm(S,'fro')
%% 特征多项式
clear,clc
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
poly(A)
A=sym(A);
charpoly(A)
%%
clear,clc
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
Q=orth(A)
%% 线性方程组解法
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
B=[1;2;3;4];
A\B
%% null
clear,clc
A = magic(4)
x1 = null(A)
norm(A*x1)
x2 = null(A,'r')
norm(A*x2)
%% pinv
A = magic(8); 
A = A(:,1:6) 
b = 260*ones(8,1)
x1 = A\b
x2 = pinv(A)*b
norm(x1)
norm(x2)
%%
clear,clc
A=[16 2 3 13;
    5 11 10 8;
    9 7 6 12;
    4 14 15 1];
[l,u,p]=lu(A);
[q,r]=qr(A)
%%
clear,clc
A = [10 -7 0
     -3  2 6
      5 -1 5];
  [L,U] = lu(A)
  L*U
[L,U,P] = lu(A)
P'*L*U
%%
clear,clc
A = magic(5);
b = 65*ones(5,1);
x = A\b
[L,U,P] = lu(A)
y = L\(P*b);
x = U\y
dA = decomposition(A,'lu');
x = dA\b
%%
S = bucky;
[L,U,P,Q] = lu(S);
e = P*S*Q - L*U;
norm(e,1)
%% qr
 A = pascal(5);
X = qr(A)
R = triu(X)
[Q1,R1] = qr(A)
%%
A = magic(5);
[Q,R] = qr(A)
norm(A-Q*R)
%% 
A = [1 0 1; 0 2 0; 1 0 3]
R = chol(A)
b = sum(A,2);
x = R\(R'\b)
%%
A = gallery('lehmer',6);
R = chol(A)
norm(R'*R - A)
L = chol(A,'lower')
norm(L*L' - A)
%%
A = tril(magic(1e4));
opts.LT = true;
b = ones(size(A,2),1);
tic
x1 = A\b; 
t1 = toc
tic
x2 = linsolve(A,b,opts);
t2 = toc
speedup = t1/t2
%% 稀疏矩阵
%sparse
A = eye(10000);
S = sparse(A);

%%
clear,clc
i = [900 1000];
j = [900 1000];
v = [10 100];
S = sparse(i,j,v,1500,1500)
%%
clear,clc
i=[1 2 3 4 5];
j=[1 2 3 4 5];
v=[4 4 4 4 4];
sparse(i,j,v,100,100)

%%
clear,clc
S = sparse(1:10,1:10,5,20,20,100)
%%
n = 9;
e = ones(n,1);
A = spdiags([e -2*e e],-1:1,n,n);
full(A)
Bin = abs(-(n-1)/2:(n-1)/2)';
d = 0;
A = spdiags(Bin,d,A);
full(A)
Bout = spdiags(A);
full(Bout)
%%
clear,clc
A = gallery('lehmer',4)
e = eig(A)
D = eig(A,'matrix')
%%
A = gallery('circul',3)
[V,D] = eig(A)
A*V - V*D
%%
clear,clc
A = magic(5)
[V,D] = eig(A)
[d,ind] = sort(diag(D))
Ds = D(ind,ind)
Vs = V(:,ind)
e1 = norm(A*V-V*D);
e2 = norm(A*Vs-Vs*Ds);
e = abs(e1 - e2)
