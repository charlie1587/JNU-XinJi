%% 空间曲面绘制
x=1:1:4;y=5:10;
[X,Y]=meshgrid(x,y);
Z=X+Y;
subplot(2,2,1)
mesh(X,Y,Z);
title('mesh')
subplot(2,2,2)
surf(X,Y,Z);
title('surf')
subplot(2,2,3)
meshc(X,Y,Z);
title('meshc')
subplot(2,2,4)
title('surfc')
surfc(X,Y,Z);

%% fmesh
clear,clc
r = @(s,t) 2 + sin(7.*s + 5.*t);
x = @(s,t) r(s,t).*cos(s).*sin(t);
y = @(s,t) r(s,t).*sin(s).*sin(t);
z = @(s,t) r(s,t).*cos(t);
fmesh(x,y,z,[0 2*pi 0 pi])

%% fmesh
clear,clc
fmesh(@(x,y) erf(x)+cos(y),[-5 0 -5 5])
hold on
fmesh(@(x,y) sin(x)+cos(y),[0 5 -5 5])
hold off
%% meshgrid
clear,clc
x = -2:0.25:2;
y = x;
[X,Y] = meshgrid(x);
F = X.*exp(-X.^2-Y.^2);
surf(X,Y,F)
%% meshgrid
clear,clc
x = 0:2:6;
y = 0:1:6;
z = 0:3:6;
[X,Y,Z] = meshgrid(x,y,z);
F = X.^2 + Y.^2 + Z.^2;
gridsize = size(F)
[X,Y,Z] = meshgrid(x);
G = X.^2 + Y.^2 + Z.^2;
gridsize = size(G)

%% mesh
clear,clc
[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(X,Y,Z)

%%
clear,clc
[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
C = X.*Y;
mesh(X,Y,Z,C)
colorbar

%%
clear,clc
[X,Y,Z] = peaks(25);
CO(:,:,1) = zeros(25); % red
CO(:,:,2) = ones(25).*linspace(0.5,0.6,25); % green
CO(:,:,3) = ones(25).*linspace(0,1,25); % blue
mesh(X,Y,Z,CO)

%%
clear 
x=-4:0.2:4;
y=-5:0.2:5;
[X,Y]=meshgrid(x,y);
Z=exp(-(X.^2+Y.^2)/8)/(2*sqrt(2*pi));
mesh(X,Y,Z)
pause
surf(X,Y,Z)

%%
[X,Y] = meshgrid(1:0.5:10,1:20);
Z = sin(X) + cos(Y);
surf(X,Y,Z)
%%
[X,Y] = meshgrid(1:0.5:10,1:20);
Z = sin(X) + cos(Y);
C = X.*Y;
surf(X,Y,Z,C)
colorbar
%% 等高线
clear,clf
a=-4:.1:4;
[x,y]=meshgrid(a);
z=x.^3+y.^3-12*x-12*y;
figure(1)
mesh(x,y,z)
figure(2)
[c,h]=contour(x,y,z);
clabel(c,h)
figure(3)
h1=[-28 -16 -8 0 6 18 26];
c1=contour(z,h1);
clabel(c1)
figure(4)
contourf(z)
figure(5)
contour(z,10)

%% 多元微积分
clear,clc
syms x y z dx dy dz
z=atan(x/y);
zx=diff(z,x);
zy=diff(z,y);
zx=simplify(zx);
zy=simplify(zy);
dz=zx*dx+zy*dy;
disp(zx);
disp(zy);
disp(dz);
%%
clear,clc
x=-1:0.1:1;
y=2*cos(asin(x));
[X Y Z]=cylinder(y,20);
surfnorm(X(:,11:21),Y(:,11:21),Z(:,11:21));
view([120,18])
%%
clear
syms x y z t
x=t;
y=t^2;
z=t^3;
a=jacobian([x,y,z],t);
disp(a)
%% 雅各比矩阵
syms x y z
jacobian([x*y*z, y^2, x + z], [x, y, z])
%第一行 x*y*z 对x求偏导数，对y求偏导数，对z求偏导数

%%
clear,clc
X=-6:0.6:6;
Y=X;
[x,y]=meshgrid(X);
f=2.*x.^2+3.*y.^3;
[Dx,Dy]=gradient(f);
quiver(X,Y,Dx,Dy);
hold on
contour(X,Y,f,20);
%%
u=-2:0.1:2;
[x,y]=meshgrid(u);
z=5-x.^4-y.^4+4.*x.*y;
mesh(x,y,z);
fun=inline('x(1)^4+x(2)^4-4*x(1)*x(2)-5');
[x,f]=fminsearch(fun,[0,0])

%% 多元函数积分

clear,clc
syms x
a=int(sin(x)^5,x,0,pi/2)

%%
clear,clc
syms x y
a=int(int(x^y,x,0,1),y,1,2);
vpa(a);
%%
fun = @(x,y) 1./( sqrt(x + y) .* (1 + x + y).^2 );
ymax = @(x) 1 - x;
q = integral2(fun,0,1,0,ymax)

%%
clear,clc
fun = @(x,y) 1./( sqrt(x + y) .* (1 + x + y).^2 );
polarfun = @(theta,r) fun(r.*cos(theta),r.*sin(theta)).*r;
rmax = @(theta) 1./(sin(theta) + cos(theta));
q = integral2(polarfun,0,pi/2,0,rmax)
%%
clear,clc
a = 3; 
b = 5;
fun = @(x,y) a*x.^2 + b*y.^2;
format long
q = integral2(fun,0,5,-5,0,'Method','iterated','AbsTol',0,'RelTol',1e-10)

%%
clear,clc
fun = @(x,y,z) x.*cos(y) + x.^2.*cos(z)
xmin = -1;
xmax = 1;
ymin = @(x)-sqrt(1 - x.^2);
ymax = @(x) sqrt(1 - x.^2);
zmin = @(x,y)-sqrt(1 - x.^2 - y.^2);
zmax = @(x,y) sqrt(1 - x.^2 - y.^2);
q = integral3(fun,xmin,xmax,ymin,ymax,zmin,zmax,'Method','tiled')

%%
a = 2;
f = @(x,y,z) 10./(x.^2 + y.^2 + z.^2 + a);
format long
q1 = integral3(f,-Inf,0,-100,0,-100,0)
q2 = integral3(f,-Inf,0,-100,0,-100,0,'AbsTol', 0,'RelTol',1e-9)
%%
f = @(r,theta,phi,xi) r.^3 .* sin(theta).^2 .* sin(phi);
Q = @(r) integral3(@(theta,phi,xi) f(r,theta,phi,xi),0,pi,0,pi,0,2*pi);
I = integral(Q,0,2,'ArrayValued',true);
I_exact = pi^2*2^4/(2*gamma(2));
%% 常微分方程求解
syms y(t) a
eqn = diff(y,t) == a*y;
S = dsolve(eqn)
%%
clear
syms y(t) a
eqn = diff(y,t,2) == a*y;
ySol(t) = dsolve(eqn)

%%
clear,clc
syms y(x)
eqn=diff(y,x,1)==log(1+x*x);
cond=y(0)==1;
dsolve(eqn)
dsolve(eqn,cond)

%%
syms y(t) a b
eqn = diff(y,t,2) == a^2*y;
Dy = diff(y,t);
cond = [y(0)==b, Dy(0)==1];
ySol(t) = dsolve(eqn,cond)
%%
clear,clc
syms y(t) z(t)
eqns = [diff(y,t) == z, diff(z,t) == -y];
S = dsolve(eqns)
%%
syms y(t) z(t)
eqns = [diff(y,t)==z, diff(z,t)==-y];
[ySol(t),zSol(t)] = dsolve(eqns)

%%
clear
syms y(t)
eqn = diff(y) == y+exp(-y)
sol = dsolve(eqn)
sol = dsolve(eqn,'Implicit',true)




