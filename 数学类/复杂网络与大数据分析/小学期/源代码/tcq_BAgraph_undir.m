function [sparsematrix, fullmatrix] = tcq_BAgraph_undir(N,m0,m)
adjacent_matrix = sparse( m0, m0);% 初始化邻接矩阵
for i = 1: m0
    for j = 1:m0
        if j ~= i      %去除每个点自身形成的环
            adjacent_matrix(i,j) = 1;%建立初始邻接矩阵，3点同均同其他的点相连
        end
    end
end
adjacent_matrix =sparse(adjacent_matrix);%邻接矩阵稀疏化
node_degree = zeros(1,m0+1);                %初始化点的度
node_degree(2: m0+1) = sum(adjacent_matrix);%对度维数进行扩展
for iter= 4:N
    iter;                               %加点
    total_degree = 2*m*(iter- 4)+6;%计算网络中此点的度之和
    cum_degree = cumsum(node_degree);%求出网络中点的度矩阵
    choose= zeros(1,m);%初始化选择矩阵
    % 选出第一个和新点相连接的顶点
    r1= rand(1)*total_degree;%算出与旧点相连的概率
    for i= 1:iter-1
        if (r1>=cum_degree(i))&&( r1<cum_degree(i+1))%选取度大的点
            choose(1) = i;
            break
        end
    end
    % 选出第二个和新点相连接的顶点
    r2= rand(1)*total_degree;
    for i= 1:iter-1
        if (r2>=cum_degree(i))&&(r2<cum_degree(i+1))
            choose(2) = i;
            break
        end
    end
    while choose(2) == choose(1)%第一个点和第二个点相同的话，重新择优
        r2= rand(1)*total_degree;
        for i= 1:iter-1
            if (r2>=cum_degree(i))&&(r2<cum_degree(i+1))
                choose(2) = i;
                break
            end
        end
    end
    % 选出第三个和新点相连接的顶点
    r3= rand(1)*total_degree;
    for i= 1:iter-1
        if  (r3>=cum_degree(i))&&(r3<cum_degree(i+1))
            choose(3) = i;
            break
        end
    end
    while (choose(3)==choose(1))||(choose(3)==choose(2))
        r3= rand(1)*total_degree;
        for i=1:iter-1
            if (r3>=cum_degree(i))&&(r3<cum_degree(i+1))
                choose(3) = i;
                break
            end
        end
    end
    %新点加入网络后, 对邻接矩阵进行更新
    for k = 1:m
        adjacent_matrix(iter,choose(k)) = 1;
        adjacent_matrix(choose(k),iter) = 1;
    end
    node_degree=zeros(1,iter+1);
    node_degree(2:iter+1) = sum(adjacent_matrix);
end
sparsematrix = adjacent_matrix;
% tu_plot(matrix,0);%画出当前的连接图
fullmatrix=full(adjacent_matrix);%得到邻接矩阵
%将主对角元素也记为1，即认为自己也属于邻居一员
for i=1:N
    fullmatrix(i,i)=1;
end
end
