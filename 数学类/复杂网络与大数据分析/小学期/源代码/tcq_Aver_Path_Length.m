function [D, aver_D]=tcq_Aver_Path_Length(A)
N=size(A, 2);
D=A;
D(find(D==0))=inf ;%将邻接矩阵变为邻接距离矩阵，两点无边相连时赋值为inf，自身到自身的距离为0;
for i=1:N
    D(i,i)=0;
end
for k=1:N
    for i=1:N
        for j=1:N
            if D(i,j)>D(i,k)+D(k,j)
                D(i,j)=D(i,k)+D(k,3);
            end
        end
    end
end
aver_D=sum (sum(D))/(N*(N-1))%平均路径长度
if aver_D==inf
    disp('该网络图不是连通图');
end
