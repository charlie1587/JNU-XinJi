%% 2.1
clear,clc
x=int16(12345);
x=complex(3,4);
isinteger(x);
isreal(x);
%% 2.2
A=[1 2 3
    4 7 9
    10 11 12
    ];
sub2ind(size(A),3,3);%下标转化为索引
[r,w]=ind2sub(size(A),7);%找到元素的索引
%创建多维数组
A=[1 2 3;4 5 6;7 8 9];
AA(:,:,1)=A;
AA(:,:,2)=A;
%% 2.3.2
clear,clc
A=[1 2 3;4 5 6;7 8 9];
find(A)%非零元素

%% 2.4
clear,clc
x=5;y=3;
[rem(x,y),mod(x,y)];
%% 2.5
c='This is a book. ';
d='   I dont linke it!    ';
e=strcat(c,d);
d=upper(d);
d=lower(d);
d=reverse(d);
d=strtrim(d);

A='The language of Technical Computing';
k=find(A>'A'&A<='Z');
clear,clc
num=1024238947;
A=string(num);

%% 2.6
f1='num';v1={1,2,3};
f2='name';v2={'Andy','Mercy','Lacy'};
f3='score';v3={100,98,20};
students=struct(f1,v1,f2,v2,f3,v3);
students(1).num;

%% 思考与练习
clear,clc
A=zeros(10);
for i=1:10
    for j=1:10
        A(i,j)=(i-1)*10+j;
    end
end

B=A(2:5,:);
A(7)=0;
A=A+30;
disp(A);
A=A-30;
[r,c]=size(A);
t=find(A);
clear,clc

A=[97 67 34 10
    -78 75 65 5
    32 5 -23 -59
    0 -12 54 7];
B=A(1:3,:);
C=A(:,1:2);
D=A(2:4,2:4);
E=B*C;

%%
clear,clc

x=-74;y=-27;
sind(x^2+y^2)/(abs(sqrt(tand(abs(x+y))))+pi);
%%
x=[3,2,1,0]
a=length(x)
b=size(x,1)
c=size(x,2)
s=sum(x)
x=[3,2,1,0; 5 6 8 7]
b=size(x,1)
c=size(x,2)
d=size(x,3)      
s=sum(x)
s2=sum(x(:))


























