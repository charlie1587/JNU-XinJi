function [D,C]=tcq_Distance_F(A)
 
N=size(A,2);
D=A;
C=A;
C((C==inf))=0;
C((C~=0))=1;
D((D==0))=inf;
for i=1:N
    D(i,i)=0;
end
for k=1:N
    for i=1:N
        for j=1:N
            if D(i,j)>D(i,k)+D(k,j)
                D(i,j)=D(i,k)+D(k,j);
                C(i,j)=C(i,k)*C(k,j);
            elseif D(i,j)==D(i,k)+D(k,j)
                if k~=i && k~=j
                    C(i,j)=C(i,j)+C(i,k)*C(k,j);
                end
            end
        end
    end
end
end
