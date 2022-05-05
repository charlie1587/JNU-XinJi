%% 2.1 曲线绘制
syms x
fplot('x^(1/3)',[0,10]);
fplot(@(x)exp(-x*x),[-5,5]);

%%
clear,clc
% syms t x y
% x=3*1*t/(1+t*t);fplot
% y=3*1*t*t/(1+t*t);
t=-2*pi:pi/500:2*pi;
x=3.*t./(1+t.*t);
y=3.*t.*t./(1+t.*t);
ezplot('x^3+y^3=3*x*y')
%%
clear,clc
x=-5:0.1:5;
y=fdhs(x);
plot(x,y),grid on
hold on
x=-5:0.5:5;
y=fdhs(x);
plot(x,y,'ro')
%% 2.2 极限与导数
clear,clc
syms x
limit((x*x*x+power(3,x))^(1/x),inf)
limit(x*cos(2*x),0)
limit(sqrt(x*x+x)-x,inf)
%%
c='x*sin(x^2-x-1)';
fplot(c,[-2 0]);grid on;
[x f]=fminbnd(c,-2,0);
func=inline(c,'x');
[x f]=fminsearch(func,-1.2)
%% 
clear,clc
syms x;
y='x*x*sin(x^2-x-2)';
fplot(y,[-2 0]);grid on;
[x f]=fminbnd(y,-1.5,1);%极小值
yy='-1*x*x*sin(x^2-x-2)';
fplot(yy,[-2 0]);grid on;
[x f]=fminbnd(yy,-2,0.5);%极大值
%%
clear,clc
syms x y
y=x*x*sin(x^2-x-2);
yx=diff(y,x,1);
fplot(yx,[-2 0]);grid on;%一阶导数
%%
clear,clc
x=-2:0.001:2;
f=x.*x.*sin(x.*x-x-2);
plot(x,f)
[ax,af]=fminbnd('x.*x.*sin(x.*x-x-2)',-2,2)
%%
clear,clc
syms x
f=x^2*exp(2*x);
f1=diff(f,x,3)
simplify(f1)
%% 2.3 求解方程组
clear,clc
syms x y a b
f=sym('a*x^2+b*x+c=0');
y=solve(f,x)
%% 
clear,clc
syms x y z
solve('x+2*y-z=27','x+z=3','x^2+3*y^2=12','x','y','z')
%%
clear,clc
syms x
eqn=2*x-1==0;
S=solve(eqn,x)
clear,clc
syms u v
eqns = [2*u + v == 0, u - v == 1];
S = solve(eqns,[u v])
%%
clear,clc
syms x y
eqn1 = x > 0;
eqn2 = y > 0;
eqn3 = x^2 + y^2 + x*y < 1;
eqns = [eqn1 eqn2 eqn3]
S = solve(eqns,[x y],'ReturnConditions',true);
S.x
%%
clear,clc
syms u v
eqns = [2*u^2 + v^2 == 0, u - v == 1];
vars = [v u];
[solv, solu] = solve(eqns,vars)
%% 
clear,clc
syms x
eqns=sin(x)/x==4/5;
S=solve(eqns,x)

%% 2.4 积分
clear,clc
syms x
int(exp(sqrt(x)),x)
%% 
syms x
int(1/(1+x^2),0,inf)
%% int
fun = @(x)x.^5.*exp(-x).*sin(x);
format long
q = integral(fun,0,Inf,'RelTol',1e-8,'AbsTol',1e-13)
%% trapz
clear,clc
X = 0:pi/100:pi;
Y = sin(X);
Q = trapz(X,Y)
%% trapz
clear,clc
X = [1 2.5 7 10];
Y = [5.2   7.7   9.6   13.2;
     4.8   7.0  10.5   14.5;
     4.9   6.5  10.2   13.8];
Q1 = trapz(X,Y,2)
%% 2.5 级数
clear,clc
syms x n
s=symsum(x/(n^2+1),n,1,10)
%% taylor
syms x
T = taylor(log(x), x, 'ExpansionPoint', 1)
%%
syms x
f = sin(x)/x;
T6 = taylor(f, x)
T8 = taylor(f, x, 'Order', 8)
T10 = taylor(f, x, 'Order', 10)
%% 
clear,clc
syms x
s=taylor(log(1+x),x,1,'Order',12)
%%
% syms pho theata
theata=-2*pi:pi/100:2*pi;
pho=exp(theata);
pho=sin(2*theata);%双扭线
polar(theata,pho)
%%
clear,clc
syms x y z
f = sin(x) + cos(y) + exp(z);
T = taylor(f)
%%
x=-6:6;
y=x.^3+x.^2+3*x+1;
plot(x,y,'r'),grid
%%
clear,clc
x=0:pi/200:2*pi;
y1=sin(x);
y2=cos(x);
plot(x,y1,x,y2,'r'),grid;
%%
fplot('atan(x)',[-10,10]),grid
%%
fplot('myfun',[-1,4])
ezplot('myfun',[-1,4])
%%
clear,clc
syms x
f=x^7;
f1=diff(f,x,3);
%%
clc,clear
[x,f]=fminbnd('x*sin(x)',-10,10);

%%
clear,clc
syms x
f=sin(x);
taylor(f, x, 'Order', 2)
taylor(f, x, 'Order', 5)
taylor(f, x, 'Order', 10)

%%
function y=fdhs(x)
n=length(x);
for i=1:n
    if x(i)>1
        y(i)=x(i)^2;
    elseif x(i)>-1
        y(i)=1;
    else
        y(i)=3+2*x(i);
    end
end
end

