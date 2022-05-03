clear;

x = [1 0.9 0.7 0.5 0.9 1 0.4
    0.9 1 0.5 0.4 0.5 0.4 0.1
    0.7 0.5 1 0.5 0.7 0.1 0.4
    0.5 0.4 0.5 1 0.5 0.7 0.9
    0.9 0.5 0.7 0.5 1 0.7 0.1
    1 0.4 0.1 0.7 0.7 1 0.5
    0.4 0.1 0.4 0.9 0.1 0.5 1]; %样本
row = size(x,1); %样本个数
biBao = transBiBao(x); %求传递闭包
[L,J] = lambdaJie(biBao); %截集
[T] = juLei(L,J,row); %聚类
H = dendrogram(T); %绘制聚类谱系图


function [Z] = jiao(X,Y) 
%两个矩阵交
[row,col] = size(X);
Z = zeros(row,col);
for i = 1:row
    Z(i,:) = min([X(i,:);Y(i,:)]);
end
end

function [Z] = bing(X,Y) 
%并
[row,col] = size(X);
Z = zeros(row,col);
for i = 1:row
    Z(i,:) = max([X(i,:);Y(i,:)]);
end
end

function [Ystar] = heCheng(X,R) 
%合成
rowX = size(X,1);
colR = size(R,2);
Ystar = zeros(rowX,colR);
for i = 1:rowX
    for j = 1:colR
        Ystar(i,j) = max(min([X(i,:);R(:,j)']));
    end
end
end

function [biBao] = transBiBao(X) 
%传递背包
Y = heCheng(X,X);
while Y ~= X
    X = Y;
    Y = heCheng(X,X);
    count=count+1;
end
biBao = Y;
biBao = biBao-diag(diag(biBao))+eye(size(biBao));
end

function [lambda,jieMatrix] = lambdaJie(X) 
%lambda截集
lambda = unique(X);
len = length(lambda);
jieMatrix = zeros([size(X),len]);
for i = 1:len
    temp = X;
    temp(X<=lambda(i)) = 0;
    temp(X>=lambda(i)) = 1;
    jieMatrix(:,:,i) = temp;
end
end

function [Z] = juLei(L,J,geShu) 
%聚类
len = size(J,3); %聚类次数
mark = [-1,-1,-1]; %暂时生成，记录每次聚类的两个对象及此使的lambda
for i=len:-1:1 %从独自一类到全部一类
    mat = triu(J(:,:,i)); %选择上三角矩阵
    [row,col] = find(mat==1);
    temp = [row,col]; %聚类的两个对象
    panDuan = [mark;[temp,ones(size(temp,1),1)*L(i)]]; %lambda
    [~,temp2] = unique(panDuan(:,1:2),'rows'); %去重
    mark = panDuan(temp2,:);
end
mark = mark(2:end,:); %将第一个去掉
mark(:,3) = 1-mark(:,3); %lambda反转
T = sortrows(mark,3); %排序

T = T(geShu+1:end,:); %将独自一类的去掉
B = T(:,1:2); %不选择lambda
len = size(B,1);
visited = [];
Y = 1:2; %为之后setdiff做准备
Z = []; %为dendrogram做准备
flag = geShu+1; %加上中间过程类的数目，不断递增

for i=1:len
    temp1 = B(i,:);
    [C,ia] = setdiff(temp1,visited); %没有出现过的记录下来
    if length(C) == 2
        Z = [Z;[temp1,T(i,3)]];
    elseif length(C) == 1 %重复的标记为flag
        temp2 = setdiff(Y,ia);
        temp1(temp2)= flag;
        flag=flag+1;
        Z = [Z;[temp1,T(i,3)]];
    end
    visited = [visited,C];
end
end