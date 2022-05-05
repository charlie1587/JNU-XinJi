clear,clc
A=[1 0.05 -0.01 0
    0 0.22 -0.17 -0.01
    0 0.10 1.14 0.10
    0 1.66 2.85 1.14
    ];
b=[0.01;0.21;-0.03;-0.44];
x0=[-0.3853493;6.1032227;0.8120005;-14];
xf=[0;0;0;0];
%%
bb=xf-A*A*x0;
aa=[A*b,b];
u=linsolve(aa,bb);
norm(aa*u-bb)
%%
aa=[A*A*b,A*b,b];
bb=xf-A^3*x0;
u=linsolve(aa,bb);
norm(aa*u-bb)
%%
aa=[A^3*b,A*A*b,A*b,b];
bb=xf-A^4*x0;
u=linsolve(aa,bb);
norm(aa*u-bb)