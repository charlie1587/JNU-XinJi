A=[0.1,0.2;0.3,0.4];
B=[0.2,0.1;0.4,0.3];
jiao(A,B)
bing(A,B)
bu(A)
lamda_m(A,0.3)

function R=jiao(A,B)
[a,b]=size(A);
R=zeros(a,b);
for i=1:a
    for j=1:b
        R(i,j)=min(A(i,j),B(i,j));
    end
end
end

function R=bing(A,B)
[a,b]=size(A);
R=zeros(a,b);
for i=1:a
    for j=1:b
        R(i,j)=max(A(i,j),B(i,j));
    end
end
end

function R=bu(A)
[a,b]=size(A);
R=zeros(a,b);
for i=1:a
    for j=1:b
        R(i,j)=1-A(i,j);
    end
end
end

function R=lamda_m(A,lamda)
[a,b]=size(A);
R=zeros(a,b);
for i=1:a
    for j=1:b
        if(A(i,j)>=lamda)
            R(i,j)=1;
        end
    end
end
end
