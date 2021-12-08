function out = FG(N,V,img,u,alpha,mode)  %                gk=feval(nprob,n,x0,2);  woods(n,x,mode)
if mode==1
%% 计算函数值
    c = length(N);
   	Fu = zeros(c,1);           %[Lia, Loc]=ismember(A,B) 判断A中的元素是否在B中找到，0表示不存在，1表示存在；该函数，返回一个与A尺寸相同的逻辑值
    tmpV = zeros(size(V));     %列表Lia，也可以返回一个Loc表（代表A中元素在B中的位置列表Loc，或者称之为索引列表）. %% Lia，Loc大小均与A相同
    [mn,loc] = ismember(V,N);  
    mn = ~mn;                  %V不在N中
    tmpV(mn) = V(mn);          %记录V中不属于N的元素的位置 属于N记为0
    for col = 1:4              %四个邻近位置需相加四次
        Fu(mn(:,col)) = Fu(mn(:,col)) + 2*PhiFun(u(mn(:,col)) - img(tmpV(mn(:,col),col)),alpha);               
        Fu(loc(:,col)~=0) = Fu(loc(:,col)~=0) + PhiFun(u(loc(:,col)~=0) -  u(loc(loc(:,col)~=0,col)),alpha);   
    end
    out = sum(Fu);
   
elseif mode==2
    c = length(N);
%% 计算梯度
    gk = zeros(c,1);
    tmpV = zeros(size(V));
    [mn,loc] = ismember(V,N);mn = ~mn;tmpV(mn) = V(mn);
    for col = 1:4
        gk(mn(:,col)) = gk(mn(:,col)) + 2*Phi_1Fun(u(mn(:,col)) - img(tmpV(mn(:,col),col)),alpha);
        gk(loc(:,col)~=0) = gk(loc(:,col)~=0) + Phi_1Fun(u(loc(:,col)~=0) -  u(loc(loc(:,col)~=0,col)),alpha);  %删除2* （Phi_1Fun）
    end
    out=gk;
end
end
