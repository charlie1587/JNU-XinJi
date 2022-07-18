function [DeD, aver_DeD]=tcq_DD(A)
NN=size(A,2);
DeD=zeros(1, NN);
for i=1:NN
    DeD(i)=sum(A(i,:) ) ;
end
aver_DeD=mean(DeD);
if sum(DeD)==0
    disp('该图只含有孤立点');
    return;
else figure;
    bar([1 :NN],DeD,'r');
    xlabel('节点编号');
    ylabel('度');
    title('度分布图');
end
figure;
M=max(DeD);
for i=1:M+1;
    N_DeD(i)=length(find(DeD==i-1));
end
P_DeD=zeros(1,M+1);
P_DeD(:)=N_DeD(:)./ sum(N_DeD);
bar([0:M],P_DeD, 'b') ;
xlabel('度');
ylabel('概率');
title('度的概率分布图');