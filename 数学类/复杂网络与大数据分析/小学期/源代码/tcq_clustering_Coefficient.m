function [c, aver_c]=tcq_clustering_Coefficient(A)
N=size(A, 2);
C=zeros(1,N);
for i=1:N
    aa=find(A(i,:)==1);%寻找子图的邻居节点
    if isempty(aa)
        disp(['节点', int2str(i),'为孤立节点']);
        c(i)=0;
    else
        m=length(aa) ;if m==1
            disp(['节点',int2str(i),'只有一个邻居节点']);
            c(i)=0;
        else
            B=A(aa, aa) ;%抽取子图的邻接矩阵
            c(i)=length(find(B==1))/(m*(m-1)) ;end
    end
end
aver_c=mean(c) ;