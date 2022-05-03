X=[37 38 12 16 13 12
    69 73 74 22 64 17
    73 86 49 27 68 39
    57 58 64 84 63 28
    ];
[s,k]=size(X);
r=zeros(s,s);
for i=1:s
    for j=1:s
        xi_=sum(X(i,:))/k;
        xj_=sum(X(j,:))/k;
        for t=1:k
            r(i,j)=r(i,j)+abs(X(i,t)-xi_)*abs(X(j,t)-xj_);
        end
        xxi_=sqrt(sum((X(i,:)-xi_).^2));
        xxj_=sqrt(sum((X(j,:)-xj_).^2));
        r(i,j)=r(i,j)/xxi_/xxj_;
    end
end

T=r;
while 1
    Y=heCheng(T,T);
    if sum(sum(Y==T))==s*s
        break;
    end
    T=Y;
end
biBao=Y;
Z=[2 3 0.0849
  5 4 0.1184
  6 1 0.1299];
dendrogram(Z);
