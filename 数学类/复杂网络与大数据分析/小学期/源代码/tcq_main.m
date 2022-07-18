%% K邻近网络
clear;
clc;
N=25;
K=8;
if K>floor(N-1)|mod(K,2)~=0;
    disp('输入错误');
    return;
end
ang1e=0:2*pi/N :2*pi-2*pi/N ;
x=100*sin(ang1e);
y=100*cos(ang1e);
plot(x, y, 'ro' , 'MarkerEdgeColor' , 'g','MarkerFaceColor', 'r', 'markersize' ,8);
hold on;
A=zeros(N);
for i=1: N
    for j=i+1:i+K/2
        jj=j ;
        if j>N
            jj=mod(j,N);
        end
        A(i,jj)=1;A(jj,i)=1;
    end
end
for i=1: N
    for j=i+1: N
        if A(i,j)~=0
            plot([x(i), x(j)],[y(i),y(j)], 'linewidth',1.2);
            hold on
        end
    end
end
axis equal;
hold off

cnt=0;
for i=1:N
    for j=1:N
        if A(i,j)>0
            cnt=cnt+1;
        end
    end
end
cnt/N/(N-1)

tcq_DD(A);
[c, aver_c]=tcq_clustering_Coefficient(A);
[D, aver_D]=tcq_Aver_Path_Length(A);
%% 随机网络
clear
clc
N=50
p=0.13
position=zeros(N, 2); 
A = zeros(N, N);%创建邻接矩阵
for m=1 :N
    %给每个点安排位置，围成一个圆
    position(m,1)=cos(m/N*2*pi);
    position(m,2)=sin(m/N*2*pi);end
figure('name', 'ER 随机图');
hold on;
plot (position(: , 1) , position(: , 2), 'd' )
for m=1:N
    for n=m+1:N
        if (rand(1,1)<p)%以0.1的概率生成边
            A(m, n)=1;%这里两句给邻接表赋值A(n, m)=1;
        end
    end
end
for m = 1:N
    for n = m+1:N
        if (A(m, n)==1)%如果有边就画出来
            plot(position([m,n],1) , position([m, n],2)) ;
        end
    end
end
hold off;

cnt=0;
for i=1:N
    for j=1:N
        if A(i,j)>0
            cnt=cnt+1;
        end
    end
end
cnt/N/(N-1)

tcq_DD(A);
[c, aver_C]=tcq_clustering_Coefficient(A);
[D, aver_D]=tcq_Aver_Path_Length(A);
%%
clear;
clc;
% WS小世界网络
N=100;
K=8;
if K>floor(N-1)|mod(K,2)~=0;
    disp('输入错误');
    return;
end
ang1e=0:2*pi/N :2*pi-2*pi/N ;
x=100*sin(ang1e);
y=100*cos(ang1e);
plot(x, y, 'ro' , 'MarkerEdgeColor' , 'g','MarkerFaceColor', 'r', 'markersize' ,8);%根据坐标画节点
hold on;
A=zeros(N);%N行N列矩阵，作为邻接矩阵用
for i=1: N
    for j=i+1:i+K/2
        jj=j ;
        if j>N
            jj=mod(j,N);
        end
        A(i,jj)=1;A(jj,i)=1;
    end
end
p=0.1;
for i=1:N
    for j=i+1:i+K/2
        jj=j ;
        if j>N
            jj=mod(j, N);end
        p1=rand(1,1);
        if p1<p
            A(i,jj)=0;
            A(jj,i)=0;
            A(i,i)=inf ;
            a=find(A(i,:)==0);
            rand_data=randi ([1,length(a)],1,1);
            jjj=a (rand_data);
            A(i,jjj)=1;A(jjj,i)=1;A(i,i)=0;
        end
    end
end
for i=1:N
    for j=i+1:N
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2);
            hold on;
        end
    end
end


cnt=0;
for i=1:N
    for j=1:N
        if A(i,j)>0
            cnt=cnt+1;
        end
    end
end

cnt/N/(N-1)

tcq_DD(A);
[c, aver_C]=tcq_clustering_Coefficient(A);
[D, aver_D]=tcq_Aver_Path_Length(A);
%%
%Nw小世界网络的代码
N=input('请输入最近邻耦合网络中节点的总数N:');
K=input('请输入最近邻耦合网络中每个节点的邻居数K:');
if K>floor(N-1)|mod(K,2)~=0;%近邻节点数不能超过剩余节点数，且近邻节点数必须为偶数
    disp('参数输入错误，K值必须是小于网络节点总数且为偶数的整数');
    return;
end
ang1e=0:2*pi/N :2*pi-2*pi/N ;
x=100*sin(ang1e);
y=100*cos(ang1e);
plot(x, y, 'ro' , 'MarkerEdgeColor' , 'g','MarkerFaceColor', 'r', 'markersize' ,8);%根据坐标画节点
hold on;
A=zeros(N);%N行N列矩阵，作为邻接矩阵用

p=input('请输入随机化加边的概率p:');
[m, n]=find(A==0);%找出所有无边相连的节点对，但要排除A(i，i)
for i=1 : length(m)
    if m(i)~=n(i)
        p1=rand(1,1) ;if p>p1
            A(m(i) , n(i))=1;
            A(n(i) , m(i))=1;%加边策略:对未加边的两节点，若随机数据小于p时加边
        end
    end
end
for i=1:N
    for j=i+1:N
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2);
            hold on;
        end
    end
end
%% 无标度网络
m_original=1;%未增长前网络节点个数
m_add=1;%每次添加一个点，增加的边数为m_add
m_after_growth=20;%增长后的网络规模
pp=1; %pp用来表示初始网络的类型
x=100*rand(1,m_original);%初始网络的横坐标
y=100*rand(1,m_original);%初始网络的纵坐标
A=zeros(m_original);%初始化邻接矩阵A，A为全0矩阵
switch pp  %选择pp，确定A的初始状态
    case 1 %节点孤立
        A=zeros(m_original);
    case 2 %全连接
        A=ones(m_original);
    case 3 %随机图
        for i=1:m_original
            for j=i+1:m_original%操作上半角矩阵
                p=rand(1,1);
                if p>0.5 %以p的概率生成边
                    A(i,j)=1;
                    A(j,i)=1;
                end
            end
        end
end
for k=m_original+1:m_after_growth%共生成m_after_growth减掉(m_original+1)条边
    M=k-1;%当前要生成第k个节点，此时的网络规模M为k-1
    p=zeros(1,M);%初始化每个节点的连接概率为全0
    x_now=100*rand(1,1);%随机生成第k个节点的坐标
    y_now=100*rand(1,1);
    x(k)=x_now;
    y(k)=y_now;
    for i=1:M
        p(i)=(length(find(A(i,:)==1))+1)/(length(find(A==1))+M);
    end %修正孤立节点连接概率为0，计算一个新节点与一个已经存在的节点i相连接的概率
    p
    pp=cumsum(p);%叠加概率，计算每行的累加值
    pp
    visit=zeros(1,M);%初始化访问数组为全0数组
    for i=1:m_add %生成m_add条边
        random_data=rand(1,1);
        random_data
        aa=find(pp>=random_data);jj=aa(1);%通过叠加概率和随机数的方法得到随机连边
        A(k,jj)=1;
        A(jj,k)=1;
        visit(jj)=1;%标记访问
        visit        %显示访问情况
        degree=zeros(1,M);%度数组
        total_degree=0;
        for ii=1:M
            if visit(ii)==1
                p(ii)=0;
                degree(ii)=0;
            else
                degree(ii)=length(A(i,:)==1)+1;
            end
            total_degree=total_degree+degree(ii);
        end
        for iii=1:M
            p(iii)=degree(iii)/total_degree;%新一轮的p数组计算
        end
        p
        pp=cumsum(p);
        pp
    end
end
A;

cnt=0;
for i=1:N
    for j=1:N
        if A(i,j)>0
            cnt=cnt+1;
        end
    end
end

ans=cnt/N/(N-1);

plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','MarkerSize',8);
hold on;
for i=1:m_after_growth
    for j=i+1:m_after_growth
        if A(i,j)~=0
            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2);
        end
    end
end
axis equal;
hold off;
% blue
% green
% red
% cyan
% magenta
% yellow
% black
retGraph = graph(A); 
[M,Q]=community_louvain(A);
figure;
h = plot(retGraph, 'NodeColor', 'green');
for i=1:300
    if M(i)==1
        highlight(h, i, 'NodeColor', 'red');
    elseif M(i)==2
        highlight(h, i, 'NodeColor', 'blue');
    elseif M(i)==3
        highlight(h, i, 'NodeColor', 'black');
    elseif M(i)==4
        highlight(h, i, 'NodeColor', 'cyan');
    elseif M(i)==5
        highlight(h, i, 'NodeColor', 'magenta');
    elseif M(i)==6
        highlight(h, i, 'NodeColor', 'yellow');
    end
end
% [c, aver_C]=tcq_clustering_Coefficient(A);
% [D, aver_D]=tcq_Aver_Path_Length(A);
%%
clear;
clc;

[sparsematrix, fullmatrix] = tcq_BAgraph_undir(20,3,1);
for i=1:20
    fullmatrix(i,i)=0;
end
retGraph = graph(fullmatrix); 
plot(retGraph,'NodeColor','k','EdgeAlpha',0.3);
pg_ranks = centrality(retGraph,'pagerank');
eig_ranks = centrality(retGraph,'eigenvector');
betw_ranks = centrality(retGraph,'betweenness');
retGraph.Nodes.PageRank = pg_ranks;
retGraph.Nodes.Eigenvector = eig_ranks;
retGraph.Nodes.Betweenness= betw_ranks;
retGraph.Nodes
[x1,index]=sort(betw_ranks);
x1=flipud(x1);
index=flipud(index);
%%
clear;
clc;
load T2.mat;
A=zeros(301);
for i=1:969
    A(T2(i,1)+1,T2(i,2)+1)=T2(i,3);
    A(T2(i,2)+1,T2(i,1)+1)=T2(i,3);
end
retGraph = digraph(A); 
plot(retGraph,'NodeColor','k','EdgeAlpha',0.3);
retGraph = graph(A); 
pg_ranks = centrality(retGraph,'pagerank');
retGraph.Nodes.PageRank = pg_ranks;
retGraph.Nodes
[x1,index]=sort(pg_ranks);
x1=flipud(x1);
index=flipud(index);
%%
load T4.mat;
A=zeros(301);
for i=1:1053
    A(T4(i,1)+1,T4(i,2)+1)=T4(i,3);
    A(T4(i,2)+1,T4(i,1)+1)=T4(i,3);
end
retGraph = graph(A); 
plot(retGraph,'NodeColor','k','EdgeAlpha',0.3);
tcq_DD(A);
[c, aver_c]=tcq_clustering_Coefficient(A);
[D, aver_D]=tcq_Aver_Path_Length(A);
retGraph = graph(A); 
pg_ranks = centrality(retGraph,'pagerank');
retGraph.Nodes.PageRank = pg_ranks;
retGraph.Nodes
[x1,index]=sort(pg_ranks);
x1=flipud(x1);
index=flipud(index);
%%
clc
G=graph(A~=0);
plot(G)
figure;
 
NN = size(A,2);
DeD = zeros(1,NN);
for i = 1:NN
    DeD(i) = sum(A(i,:));
end
 
aver_DeD = mean(DeD);
if sum(DeD)==0
    disp('该网络图只是由一些孤立点组成');
    return;
else subplot(3,2,1);
    bar([1:NN],DeD);
    xlabel('节点编号n');
    ylabel('各节点的度数K');
    title('网络图中各节点的度的大小分布图');
end
 
M = max(DeD);
for i = 1:M+1
    N_DeD(i) = length(find(DeD==i-1));
end
P_DeD = zeros(1,M+1);
P_DeD(:) = N_DeD(:)./sum(N_DeD);
subplot(3,2,2)
bar([0:M],P_DeD,'r');
xlabel('节点的度K');
ylabel('节点的度为K的概率P(K)');
title('网络图中节点的度的概率分布');
 
d = size(A,2);
C = zeros(1,d);
for i = 1:d
    aa = find(A(i,:)==1);
    if isempty(aa)
        C(i) = 0;
    else
        m = length(aa);
        if m==1
            C(i) = 0;
        else
            B = A(aa,aa);
            C(i) = length(find(B==1))/(m*(m-1));
        end
    end
end
aver_C = C;
i = 1:d;
subplot(3,2,3)
plot(i,aver_C)
title('网络图中各节点的聚类系数');
 
d = size(A,2);
D = A;
D(find(D==0))=inf;
for i = 1:d
    D(i,i) = 0;
end
for k = 1:d
    for i = 1:d
        for j = 1:d
            if D(i,j)>D(i,k)+D(k,j)
                D(i,j)=D(i,k)+D(k,j);
            end
        end
    end
end
aver_D = sum(D)/(d-1);
i = 1:d;
subplot(3,2,4)
plot(i,aver_D)
title('网络图中各节点的平均路径长度');
 
if aver_D==inf
    disp('该网络不是连通图');
end
 
G = graph(A~=0);
DC = degree(G)./(d-1);
i = 1:d;
subplot(3,2,5)
plot(i,DC)
title('网络图中节点的度中心性值');
 
d=size(A,1);
B=zeros(1,d);
[D,C]=tcq_Distance_F(A);
for k=1:d
    for i=1:d
        if i~=k
            for j=i+1:d
                if j~=k
                    if D(i,j)==D(i,k)+D(k,j)&&C(i,j)~=0
                        B(k)=B(k)+C(i,k)*C(k,j)/C(i,j);
                    end
                end
            end
        end
    end
end
i = 1:d;
subplot(3,2,6)
plot(i,B)
title('网络图中节点的归一化介数');
%%
[M,Q]=community_louvain(A)
N=301;


%% 

mat=A;
n=length(mat);
m=sum(sum(mat))/2;
 
vs=[1:n];   %vs are the vertices which need to be recalculate
for i1=1:m
    smat=zeros(n);
    %calculate the shortest-path betweenness
    for i2=1:length(vs)
        %BFS
        ln=0;   %number of leaves
        D=zeros(1,length(vs))-1;
        D(vs(i2))=0;
        W(vs(i2))=1;
        pah=1;pat=1;    %two pointers indicate the index of array
        array(pat)=vs(i2);
        pat=pat+1;
        %calculate the distances and weight of vertices
        while(pah<pat)
            tp=array(pah);
            leaf=1; %assume tp is a leaf
            for i3=1:length(vs)
                if(mat(vs(tp),vs(i3)))
                    if(D(vs(i3))==-1)
                        leaf=0; %tp isn't a leaf
                        array(pat)=vs(i3);
                        pat=pat+1;
                        D(vs(i3))=D(vs(tp))+1;
                        W(vs(i3))=W(vs(tp));
                    elseif(D(vs(i3))==D(vs(tp))+1)
                        W(vs(i3))=W(vs(i3))+W(vs(tp));
                    end
                end
            end
            if(leaf)
                ln=ln+1;
                leaves(ln)=tp;
            end
            pah=pah+1;
        end
        %calculate the betweenness of the edges
        tvs=vs;
        for i3=1:length(tvs) %sort vs by des of D
            for i4=i3+1:length(tvs)
                if(D(tvs(i3))<D(tvs(i4)))
                    t=tvs(i3);
                    tvs(i3)=tvs(i4);
                    tvs(i4)=t;
                end
            end
        end
        tmat=zeros(n);  %temp matrix to save the betweenness
        T=zeros(1,n);   %temp array to save the sum of betweenness of the lower edges of a vertex
        for i3=1:length(tvs)
            tp=tvs(i3);
            for i4=1:length(tvs)
                if(mat(tvs(i3),tvs(i4)) && D(tvs(i3))==D(tvs(i4))-1 && D(tvs(i3))~=-1)
                    T(tvs(i3))=T(tvs(i3))+tmat(tvs(i3),tvs(i4));
                end
            end
            for i4=1:length(tvs)
                if(mat(tvs(i3),tvs(i4)) && D(tvs(i3))==D(tvs(i4))+1 && D(tvs(i4))~=-1)
                    tmat(tvs(i3),tvs(i4))=(T(tvs(i3))+1)*W(tvs(i4))/W(tvs(i3));
                    tmat(tvs(i4),tvs(i3))=tmat(tvs(i3),tvs(i4));
                end
            end
        end
        smat=smat+tmat;
    end
    %find the max-betweenness edge
    t=0;
    for i2=1:n
        for i3=1:n
            if(smat(i2,i3)>t)
                t=smat(i2,i3);
                cut(i1,:)=[i2 i3 smat(i2,i3)];
            end
        end
    end
    %save('tmat.txt','mat','-ascii');
    mat(cut(i1,1),cut(i1,2))=0;
    mat(cut(i1,2),cut(i1,1))=0;
end

figure;
h = plot(retGraph, 'NodeColor', 'g');
for i=1:19
    if cut(i,1)>=cut(i,2) && cut(i,1)>=cut(i,3)
        highlight(h, i, 'NodeColor', 'r');
    elseif cut(i,2)>=cut(i,3) && cut(i,2)>=cut(i,1)
        highlight(h, i, 'NodeColor', 'b');
    elseif cut(i,3)>=cut(i,1) && cut(i,3)>=cut(i,2)
        highlight(h, i, 'NodeColor', 'black');
    end
end


