clear all
clc;
format long
format compact

%% ����latex����ļ�
fid_tex=fopen('mytext.txt','w');               

%% ��ʼ������
np = 100;  % ���⼯�ĸ���
ns = 5;  % �㷨�ĸ���
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

%% ����
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
%% �ر��ļ�
fclose(fid_tex);

%% ��ͼ
clf;   %clfɾ����ǰͼ�δ����С�
       %%���δ������(�����ǵ�HandleVisibility����Ϊon)��ͼ�ζ���
figure(1);
%subplot(2,2,1);
perf(T,'logplot');
%title('ʱ������');
%set(gca,'ylim',[0.3,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
%legend('FHTTCGM_N','KD','HD','Location','southeast'); 
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');     %�޸ĳ�������������һ��0���Զ���λ�ã������figure(2)~figure(5)ͬ��
%subplot(2,2,2);
figure(2);
perf(NF,'logplot');
%title('Ŀ�꺯����������');
% set(gca,'ylim',[0.1,1]);
xlabel('\tau','Interpreter','tex');                     %% ��x���ע
ylabel('\rho(\tau)','Interpreter','tex');               %% ��y���ע
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');%% �߷���˵��
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');
%subplot(2,2,3);
figure(3);
perf(NG,'logplot');
%title('�ݶȺ�����������');
%set(gca,'ylim',[0.5,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');
%subplot(2,2,4);
figure(4);
perf(NI,'logplot');
%title('������������');
%set(gca,'ylim',[0.5,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
%legend('Jhp00','Jhp12','AN','WH','DY+','location','best');
legend('FHTTCGM_N','KD','HD','HZ','MTTLS','Location','southeast');
%���figure(5)�������֡�����Ng����ͼ
% figure(5);
% perf(Ng,'logplot');
% %title('�ݶ�ֵ����');
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
%perf(T,'logplot');% �ˡ�logplot���κ�һ��ȷ���ĳ��������ԣ�ֻҪ��֤�������������

%% ͼƬ������ Latex ˵��
% ��1��.pdf��ʽ�洢���Ƽ�ʹ�ã�
% step 1 figure ͼƬ��,�� >file >> print preview >> 
% step 2
% ��placement����top:0;�������Կ��������.paper������Ҫ����Height.Orientation:Portrait
% step 3 >print ��ȷ��������������
% 
%��2��.eps��ʽ�洢�����Ƽ�ʹ�ã�
% ����Ϊcomplile ����ʱ��һ����õ�pdflatex,��������޷���ȡeps�ĵ���
% �������ʱ����Ҫ����˳����ɵġ�
% ���������
% �������ʱ��c:\ ���ڣ��м��룺��һ�� latex filename.tex  >>  dvipdfm filename.dvi 
%                               �ڶ��� latex filename.tex >> dvips filename.dvi >> ps2pdf filename.ps
% 
%��3�� ����ͼ�κ����Ϊʱ��ѡ���ʽ��jpg,bmp,eps���洢�����Ǵ洢��ͼ�λ���Σ�Ч������