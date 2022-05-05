%%
clear,clc
binopdf(0,200,0.02)
defects = 0:200;
y = binopdf(defects,200,.02);
plot(defects,y)
[x,i] = max(y);
defects(i)
%%
lambda = 0:10;
y = 1 - poisscdf(4,lambda);
scatter(lambda,y,'Marker',"o")
grid on
%%
x = [-2,-1,0,1,2];
y = normpdf(x)
%%
x = [-2,-1,0,1,2];
mu = 2;
sigma = 1;
y = normpdf(x,mu,sigma)
mu = [-2,-1,0,1,2];
sigma = 1;
y = normpdf(0,mu,sigma)
%%
p = normcdf([-1 1]);
p(2)-p(1)
%%
clear,clc
x = [-2,-1,0,1,2];
mu = 2;
sigma = 1;
p = normcdf(x,mu,sigma)
mu = [-2,-1,0,1,2];
sigma = 1;
p = normcdf(0,mu,sigma)
%%
x = norminv([0.025 0.975])
xl = norminv([0.01 0.96])

%%
lambda = 10:2:20
r = poissrnd(lambda)
%%
n = 1:10:100;
r = unidrnd(n)
%%
clear,clc
A=ones(1);
for k=1:20
    n=10000000;
    a=rand(n,2);
    m=0;
    for i=1:n
        if a(i,1)^2+a(i,2)^2<=1
            m=m+1;
        end
    end
    b=m/n;
    A(k)=b;
end
format long
p1=mean(A);
p=4*b;
p,pi
%%
clear,clc
load carsmall
x1 = Weight;
x2 = Horsepower;    % Contains NaN data
y = MPG;
X = [ones(size(x1)) x1 x2 x1.*x2];
b = regress(y,X)    % Removes NaN data
scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Weight')
ylabel('Horsepower')
zlabel('MPG')
view(50,10)
hold off

%%
clear,clc
load examgrades
y = grades(:,5);
X = [ones(size(grades(:,1))) grades(:,1:2)];
[~,~,r,rint] = regress(y,X,0.01);
contain0 = (rint(:,1)<0 & rint(:,2)>0);
idx = find(contain0==false)
hold on
scatter(y,r)
scatter(y(idx),r(idx),'b','filled')
xlabel("Last Exam Grades")
ylabel("Residuals")
hold off
%%
load hald
y = heat;
X1 = ingredients;
x1 = ones(size(X1,1),1);
X = [x1 X1];    % Includes column of ones
[~,~,~,~,stats] = regress(y,X)
%%
load examgrades
x = grades(:,1);
[h,p,ci,zval] = ztest(x,75,10)
%%
clear,clc
load examgrades
x = grades(:,1);
[h,p] = ztest(x,65,10,'Tail','right')
%%
load census;
f=fit(cdate,pop,'poly2')
plot(f,cdate,pop)
%%
clear,clc
load franke
sf = fit([x, y],z,'poly23')
plot(sf,[x,y],z)
%%
clear,clc
load franke
T = table(x,y,z);
f = fit([T.x, T.y],T.z,'linearinterp');
plot( f, [T.x, T.y], T.z )
%%
clear,clc
load census
plot(cdate,pop,'o')
fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0],...
               'Upper',[Inf,max(cdate)],...
               'StartPoint',[1 1]);
ft = fittype('a*(x-b)^n','problem','n','options',fo);
[curve2,gof2] = fit(cdate,pop,ft,'problem',2)
[curve3,gof3] = fit(cdate,pop,ft,'problem',3)
hold on
plot(curve2,'m')
plot(curve3,'c')
legend('Data','n=2','n=3')
hold off
%% 
clear,clc
load census;
f=fit(cdate,pop,'poly3','Normalize','on','Robust','Bisquare')
plot(f,cdate,pop)
%%
[x, y] = titanium;

gaussEqn = 'a*exp(-((x-b)/c)^2)+d'
startPoints = [1.5 900 10 0.6]
f1 = fit(x',y',gaussEqn,'Start', startPoints, 'Exclude', [1 10 25])
f2 = fit(x',y',gaussEqn,'Start', startPoints, 'Exclude', x < 800)
plot(f1,x,y)
title('Fit with data points 1, 10, and 25 excluded')
figure
plot(f2,x,y)
title('Fit with data points excluded such that x < 800')
%%
[x, y] = titanium;

gaussEqn = 'a*exp(-((x-b)/c)^2)+d'
startPoints = [1.5 900 10 0.6]
exclude1 = [1 10 25];
exclude2 = x < 800;
f1 = fit(x',y',gaussEqn,'Start', startPoints, 'Exclude', exclude1);
f2 = fit(x',y',gaussEqn,'Start', startPoints, 'Exclude', exclude2);
plot(f1,x,y,exclude1)
title('Fit with data points 1, 10, and 25 excluded')
figure; 
plot(f2,x,y,exclude2)
title('Fit with data points excluded such that x < 800')
load franke
f1 = fit([x y],z,'poly23', 'Exclude', [1 10 25]);
f2 = fit([x y],z,'poly23', 'Exclude', z > 1);

figure
plot(f1, [x y], z, 'Exclude', [1 10 25]);
title('Fit with data points 1, 10, and 25 excluded')
figure
plot(f2, [x y], z, 'Exclude', z > 1);
title('Fit with data points excluded such that z > 1')
%%
clear,clc
load stockreturns
x = stocks(:,3);
[h,p,ci,stats] = ttest(x)

%%
clear,clc
load moore
X = [ones(size(moore,1),1) moore(:,1:5)];
y = moore(:,6);
alpha = 0.05;
[betahat,Ibeta,res,Ires,stats] = regress(y,X,alpha);
rcoplot(res,Ires)










