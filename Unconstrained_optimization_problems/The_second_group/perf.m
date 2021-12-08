 function perf(T,logplot)
%PERF    Performace profiles
%
% PERF(T,logplot)-- produces a performace profile as described in
%   Benchmarking optimization software with performance profiles,
%   E.D. Dolan and J.J. More', 
%   Mathematical Programming, 91 (2002), 201--213.
% Each column of the matrix T defines the performance data for a solver.
%%% Failures on a given problem are represented by a NaN.   这句很关键啊
% The optional argument logplot is used to produce a 
% log (base 2) performance plot.
%
% This function is based on the perl script of Liz Dolan.
%
% Jorge J. More', June 2004
% clear all
% clc
% T=rand(50,4)
% nargin=2
% logplot=1;
if (nargin < 2) logplot = 0; end

%plot LineSpec特征
%colors  = ['m' 'b' 'r' 'g' 'k' 'c' 'y'];% 'm'品红色 'w'为白色没输入
colors  = ['m' 'b' 'r' 'g' 'k' 'c' 'y' 'm' 'b' 'r' 'g' 'k' 'c' 'y'];% 修改的，增加一组颜色，7*2=14
%lines   = [':' '-' {'-.'} {'--'}];%输入根据输入参数个数进行修改（超过4个处理器）
%lines   = [':' '-' {'-.'} {'--'} ':'];     这是原来的，只有5根线（4+1=5）
lines   = [':' '-' {'-.'} {'--'} ':' '-' {'-.'} {'--'} ':' '-' {'-.'} {'--'}];      %这个修改的，有12根线（4*3=12）
%markers = ['x' '*' 's' 'd' 'v' '^' 'o'];% 参考http://wiki.ilovematlab.cn/doc-view-54.html
markers = ['x' '*' 's' 'd' 'v' '^' 'o' '+' 'h' 'p' '>' '<' '.'];        %修改的，增加6个marker，共13个

[np,ns] = size(T);

% Minimal performance per solver

minperf = min(T,[],2);%每行中的最小数组成一列

% Compute ratios and divide by smallest element in each row.

r = zeros(np,ns);
for p = 1: np
  r(p,:) = T(p,:)/minperf(p);
end

if (logplot) r = log2(r); end

max_ratio = max(max(r));%取出r矩阵所有元素中的最大数值

% Replace all NaN's with twice the max_ratio and sort.

r(find(isnan(r))) = 2*max_ratio;%将矩阵r 中的NaN项赋值为最大r中最大数值的2倍
r = sort(r);

% Plot stair graphs with markers.

%clf;
for s = 1: ns
 [xs,ys] = stairs(r(:,s),[1:np]/np);
 option = [lines(s) colors(s) markers(s)];
 plot(xs,ys,cell2mat(option),'MarkerSize',3);
 hold on;
end

% Axis properties are set so that failures are not shown,
% but with the max_ratio data points shown. This highlights
% the "flatline" effect.
%set(gca,'xlim',[0,3]) 设置 x轴 的范围

axis([ 0 1.1*max_ratio 0 1 ]);

% Legends and title should be added.



