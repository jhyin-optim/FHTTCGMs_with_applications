function out = FG(N,V,img,u,alpha,mode)  %                gk=feval(nprob,n,x0,2);  woods(n,x,mode)
if mode==1
%% ���㺯��ֵ
    c = length(N);
   	Fu = zeros(c,1);           %[Lia, Loc]=ismember(A,B) �ж�A�е�Ԫ���Ƿ���B���ҵ���0��ʾ�����ڣ�1��ʾ���ڣ��ú���������һ����A�ߴ���ͬ���߼�ֵ
    tmpV = zeros(size(V));     %�б�Lia��Ҳ���Է���һ��Loc������A��Ԫ����B�е�λ���б�Loc�����߳�֮Ϊ�����б�. %% Lia��Loc��С����A��ͬ
    [mn,loc] = ismember(V,N);  
    mn = ~mn;                  %V����N��
    tmpV(mn) = V(mn);          %��¼V�в�����N��Ԫ�ص�λ�� ����N��Ϊ0
    for col = 1:4              %�ĸ��ڽ�λ��������Ĵ�
        Fu(mn(:,col)) = Fu(mn(:,col)) + 2*PhiFun(u(mn(:,col)) - img(tmpV(mn(:,col),col)),alpha);               
        Fu(loc(:,col)~=0) = Fu(loc(:,col)~=0) + PhiFun(u(loc(:,col)~=0) -  u(loc(loc(:,col)~=0,col)),alpha);   
    end
    out = sum(Fu);
   
elseif mode==2
    c = length(N);
%% �����ݶ�
    gk = zeros(c,1);
    tmpV = zeros(size(V));
    [mn,loc] = ismember(V,N);mn = ~mn;tmpV(mn) = V(mn);
    for col = 1:4
        gk(mn(:,col)) = gk(mn(:,col)) + 2*Phi_1Fun(u(mn(:,col)) - img(tmpV(mn(:,col),col)),alpha);
        gk(loc(:,col)~=0) = gk(loc(:,col)~=0) + Phi_1Fun(u(loc(:,col)~=0) -  u(loc(loc(:,col)~=0,col)),alpha);  %ɾ��2* ��Phi_1Fun��
    end
    out=gk;
end
end
