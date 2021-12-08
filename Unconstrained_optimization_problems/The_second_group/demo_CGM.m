clear all
clc;
format long
format compact

%% 建立latex表格文件
fid_tex=fopen('mytext.txt','w');               

%% 初始化参数
np = 100;  % 问题集的个数
ns = 5;  % 算法的个数
T=zeros(np,ns);
NF=zeros(np,ns);
NG=zeros(np,ns);
NI=zeros(np,ns);
Ng=zeros(np,ns); % the final value of ||g_{k}||

%% Set parameters 
% hHPR, hHD, DPRP
para1.Itrmax = 2000;
para1.NLmax = 10;
para1.epsilon = 10^-6;
% para1.varepsilon = 10^-10;
para1.delta = 0.01;
para1.sigma = 0.1;

para2.Itrmax = 2000;
para2.NLmax = 10;
para2.epsilon = 10^-6;
para2.varepsilon = 10^-10;
para2.delta = 0.01;
para2.sigma = 0.1;

%% 运行
for i= 1:np
    [name,n,a]=init(i);
    [T1,NFF1,NGG1,NI1,N1] = CGMWWP(i,para1,'FHTTCGM_N');
    [T2,NFF2,NGG2,NI2,N2] = CGMWWP(i,para1,'KD');
    [T3,NFF3,NGG3,NI3,N3] = CGMWWP(i,para1,'HD'); 
    [T4,NFF4,NGG4,NI4,N4] = CGMWWP(i,para1,'HZ');
    [T5,NFF5,NGG5,NI5,N5] = CGMWWP(i,para1,'MTTLS');

    T(i,:) = [T1,T2,T3,T4,T5];   %
    NF(i,:) = [NFF1,NFF2,NFF3,NFF4,NFF5];
    NG(i,:) = [NGG1,NGG2,NGG3,NGG4,NGG5];
    NI(i,:) = [NI1,NI2,NI3,NI4,NI5];
    Ng(i,:) = [N1,N2,N3,N4,N5];

    fprintf(fid_tex,'%s/%d & %d/%.3f/%.2e & %d/%.3f/%.2e & %d/%.3f/%.2e & %d/%.3f/%.2e & %d/%.3f/%.2e\\\\ \r\n',...
                name,n,NI1,T1,N1,NI2,T2,N2,NI3,T3,N3,NI4,T4,N4,NI5,T5,N5);%);%
end
%% 关闭文件
fclose(fid_tex);

%% 画图
clf;   %clf删除当前图形窗口中、
       %%句柄未被隐藏(即它们的HandleVisibility属性为on)的图形对象。
figure(1);
%subplot(2,2,1);
perf(T,'logplot');
%title('时间性能');
%set(gca,'ylim',[0.3,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
%legend('FHTTCGM_N','KD','HD','Location','southeast'); 
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');     %修改成这样，在最后加一个0，自动找位置，下面的figure(2)~figure(5)同理
%subplot(2,2,2);
figure(2);
perf(NF,'logplot');
%title('目标函数计算性能');
% set(gca,'ylim',[0.1,1]);
xlabel('\tau','Interpreter','tex');                     %% 给x轴加注
ylabel('\rho(\tau)','Interpreter','tex');               %% 给y轴加注
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');%% 线分类说明
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');
%subplot(2,2,3);
figure(3);
perf(NG,'logplot');
%title('梯度函数计算性能');
%set(gca,'ylim',[0.5,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');
%subplot(2,2,4);
figure(4);
perf(NI,'logplot');
%title('迭代次数性能');
%set(gca,'ylim',[0.5,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');
%添加figure(5)，画体现【参数Ng】的图
% figure(5);
% perf(Ng,'logplot');
% %title('梯度值性能');
% %set(gca,'ylim',[0.5,1]);
% xlabel('\tau','Interpreter','tex');
% ylabel('\rho(\tau)','Interpreter','tex');
% %legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
% legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');

%hold on
%text
%axes
%set(gca,'xtick',[],'ytick',[]) 
%figure(2);
%perf(T,'logplot');% 此“logplot”任何一个确定的常数都可以，只要保证有两个输入变量

%% 图片导出到 Latex 说明
% 第1种.pdf格式存储（推荐使用）
% step 1 figure 图片中,点 >file >> print preview >> 
% step 2
% 对placement项中top:0;其他属性看情况设置.paper项中需要设置Height.Orientation:Portrait
% step 3 >print 后按确定保存命名即可
% 
%第2种.eps格式存储（不推荐使用）
% （因为complile 编译时，一般采用的pdflatex,这个命令无法读取eps文档）
% 这种情况时，需要编译顺序造成的。
% 解决方法：
% 编译过程时（c:\ 窗口）中键入：第一种 latex filename.tex  >>  dvipdfm filename.dvi 
%                               第二种 latex filename.tex >> dvips filename.dvi >> ps2pdf filename.ps
% 
%第3种 生成图形后，另存为时，选择格式（jpg,bmp,eps）存储，但是存储后，图形会变形，效果不好