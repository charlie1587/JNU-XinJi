function [Ystar] = heCheng(X,R) 
%合成
rowX = size(X,1);
colR = size(R,2);
Ystar = zeros(rowX,colR);
for i = 1:rowX
    for j = 1:colR
        Ystar(i,j) = max(min([X(i,:);R(:,j)']));
    end
end
end