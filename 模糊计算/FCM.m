%% 清空环境变量
clear;
clc;
close all;

%% 初始化参数
data = rand(100, 2);
figure;
plot(data(:, 1), data(:, 2), 'ro', 'MarkerSize', 8);
xlabel '横坐标X'; ylabel '纵坐标';
title '样本数据';
K = 4;              % 分类个数
maxgen = 100;       % 最大迭代次数
alpha = 3;          % 指数的次幂
threshold = 1e-6;   % 阈值
[data_n, in_n] = size(data);   % 行数，即样本个数/列数，即样本维数
% 初始化隶属度矩阵
U = rand(K, data_n);
col_sum = sum(U);
U = U./col_sum(ones(K, 1), :);

%% 迭代
for i = 1:maxgen
    % 更新聚类中心
    mf = U.^alpha;
    center = mf*data./((ones(in_n, 1)*sum(mf'))');
    % 更新目标函数值
    dist = zeros(size(center, 1), data_n);
    for k = 1:size(center, 1)
        dist(k, :) = sqrt(sum(((data-ones(data_n, 1)*center(k, :)).^2)', 1));
    end
    J(i) = sum(sum((dist.^2).*mf));
    % 更新隶属度矩阵
    tmp = dist.^(-2/(alpha-1));
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