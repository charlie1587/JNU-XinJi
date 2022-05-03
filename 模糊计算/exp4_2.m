clear;
close all;
clc;
%% 初始化参数
america=[2112 7.59 6172.3 6.963 218.927 -37.125 552.953 8 93 23.5];
canada=[197.47 1.906 4801.8 0.838 56.825 1.358 716.07 98 93 2.4];
mexico=[92.616 1.961 883.8 0.405 12.086 -3.104 586.24 98 93 354.9];
australia=[116.249 1.485 4955.5 0.405 18.232 0.433 717.144 98 122 1.9];
hongkong=[13.68 1.485 2257.1 0.047 17.137 -2.305 664.956 8 4 4530];
india=[117.656 6.064 121.3 13.794 8.15 -1.71 363.565 38 4 198];
japan=[1053.32 18.839 5305 1.17 110.67 -7.625 206.142 8 4 312.4];
singapore=[8.121 5.822 2138.3 0.011 17.635 -3.402 515.021 8 4 83];
tailand=[21.785 2.113 313.3 0.263 7.156 -1.848 554.279 38 4 83];
egypt=[18.761 0.991 296.8 0.375 8.837 -1.997 570.578 38 33 40.8];
iran=[19.274 6.745 627.3 0.011 7.261 11.739 794.799 68 4 27.7];
lebanon=[3.086 1.926 1262.5 0.062 2.414 -1.709 595.918 38 4 299];
morocco=[13.329 0.231 478.9 0.018 3.807 -1.935 573.074 68 33 43.9];
somalia=[0.249 0.069 252.9 0.021 0.44 -0.258 564.102 68 33 5.6];
zambia=[-2.9 0.064 252.9 0.021 0.756 0.572 664.776 68 33 7.6];
sudan=[5.307 0.048 244.8 0.003 1.11 -0.575 637.408 68 33 7.1];
korea=[47.583 2.488 794.7 0.542 20.399 -5.284 516.577 98 4 383.8];
pakistan=[19.727 0.511 215 0.146 4.061 -1.025 315.374 38 4 99.2];
peru=[8.894 1.795 400.8 0.386 2.146 1.386 510.493 38 93 13.6];
malaysia=[16.249 8.379 881.8 0.094 7.849 3.228 580.209 68 4 100];
X=[america;canada;mexico;australia;hongkong;india;japan;
    singapore;tailand;egypt;iran;lebanon;morocco;somalia;
    zambia;sudan;korea;pakistan;peru;malaysia];
data=X;
data=zscore(data);
PCAdata=pca(data);
% 初始化隶属度矩阵
[centers,U] = fcm(data,3);
%%
K = 2;              % 分类个数
maxgen = 100;       % 最大迭代次数
m = 2;              % 指数的次幂
threshold = 1e-6;   % 阈值
[data_n, in_n] = size(data);   % 行数，即样本个数/列数，即样本维数
% 初始化隶属度矩阵
U = rand(K, data_n);
col_sum = sum(U);
U = U./col_sum(ones(K, 1), :);

%% 迭代
for i = 1:maxgen
    % 更新聚类中心
    mf = U.^m;
    center = mf*data./((ones(in_n, 1)*sum(mf'))');
    % 更新目标函数值
    dist = zeros(size(center, 1), data_n);
    for k = 1:size(center, 1)
        dist(k, :) = sqrt(sum(((data-ones(data_n, 1)*center(k, :)).^2)', 1));
    end
    J(i) = sum(sum((dist.^2).*mf));
    % 更新隶属度矩阵
    tmp = dist.^(-2);
    U = tmp./(ones(K, 1)*sum(tmp));
    % 终止条件判断
    if i > 1
        if abs(J(i) - J(i-1)) < threshold
            break;
        end
    end
end

%% 绘图
[max_vluae, index] = max(U);
index = index';
figure;
for i = 1:K
    col = find(index == i);      % max(U)返回隶属度列最大值所在行一致的分为一类
    plot(data(col, 1), data(col, 2), '*', 'MarkerSize', 8);
    hold on
end
grid on
% 画出聚类中心
plot(center(:, 1), center(:, 2), 'p', 'color', 'm', 'MarkerSize', 12);
xlabel '横坐标X'; ylabel '纵坐标Y';
title 'FCM优化后的聚类图';
% 目标函数变化过程
figure;
plot(J, 'r', 'linewidth', 2);
xlabel '迭代次数'; ylabel '目标函数值';
title 'FCM聚类目标函数变化过程';
grid on