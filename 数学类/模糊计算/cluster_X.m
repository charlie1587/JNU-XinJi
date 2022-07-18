function T=cluster_X(X)

lamdba=unique(X);
[lenl,~]=size(lamdba);
[len,~]=size(X);
T=zeros(1,3);

%大于lamdba的结合
for i=1:len
    X(i,i)=-1;
end
sets=zeros(len,len);
sets(:,1)=1:len;

for i=1:len
    for j=i:len
        if X(i,j)>=lamdba(lenl)
            sets=connect_sets(i,j,sets);
        end
    end
end
%构造树
[slen,ss]=size(sets);
for i=1:slen
    tempL=0;
    for j=1:ss
        if sets(i,j)>0
            tempL=tempL+1;
        end
    end
    if tempL>1
        for tt=1:tempL-1
            T=[T;sets(i,tt),sets(i,tt+1),1-lamdba(lenl)];
        end
    end
    
end

end