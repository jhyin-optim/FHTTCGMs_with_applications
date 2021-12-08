function [Tcpu,NFF,NGG,NI] = new(NO,method) 
% clear all
format long
% method='HS'; %% DY FR WYL
% NO=41;
 [nprob,n,x0]=init(NO);
epsilon=1e-6;
% gk=grdfcn(n,m,x0,nprob);
gk=feval(nprob,n,x0,2);
dk=(-1)*gk;
delta=0.1;% delta=0.01;
omega=0.9;% omega=0.04;
t=norm(gk)^(-1);

 NGG=1; %梯度计算次数
 NFF=1; %目标函数计算次数
 K=1;
 NI=1;
tic;
j=1;
while (NI<6000) %&&(epsilon<q)
    a1=0;
    a2=10;
    x1=x0+t*dk;
    f=feval(nprob,n,x0,1);
    f_new=f;
    f1=feval(nprob,n,x1,1);
    
    g0=gk'*dk;
    
% %% %%% Start weak Wolfe line search  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     alpha = 0;  % lower bound on steplength conditions
%     %xalpha = x;
%     %falpha = f;
%     beta = inf;  % upper bound on steplength satisfying weak Wolfe conditions
%     %gradbeta = nan*ones(size(x));
%     
%     t = 1;  % important to try steplength one first
%     %nfeval = 0;
%     nbisect = 0;
%     nexpand = 0;
%     % the following limits are rather arbitrary
%     % nbisectmax = 30; % 50 is TOO BIG, because of rounding errors
%     dnorm = norm(dk);
%     nbisectmax = max(30, round(log2(1e5*dnorm))); % allows more if ||d|| big
%     nexpandmax = max(10, round(log2(1e5/dnorm))); % allows more if ||d|| small
%     done = 0;
%     success_flag=0;
%     while ~done
%         L1=1;
%         L2=1;
%         % x_new = x + t*p;  
%         % f_new = feval(nprob,n,x_new,1); % objfcn(n,m,x_new,nprob);  
%         % Nf=Nf+1;
%       
%         % the first condition must be checked first
%         if f1 > f+delta*t*g0 % first condition violated, gone too far
%             L1=0;
%             beta = t;
%             %gradbeta = g_new;
%         else
%             g_new = feval(nprob,n,x1,2);% grdfcn(n,m,x_new,nprob);
%             % Ng=Ng+1;
%             NGG=NGG+1;
%             g1 = g_new'*dk;  % Checked!
%             if g1 < omega*g0 || g1>-omega*g0% second condition violated, not gone far enough
%                 L2=0;
%                 alpha = t;
%                 %xalpha = x_new;
%                 %falpha = f_new;
%             end
%         end
%         if (L1==1 && L2==1)
%             success_flag=1;
%             fail = 0;
%             alpha = t;
%             %xalpha = x_new;
%             %falpha = f_new;
%             beta = t;
%             %gradbeta = g_new;
%             break
%         end
%         % setup next function evaluation
%         if beta < inf
%             if nbisect < nbisectmax
%                 nbisect = nbisect + 1;
%                 t = (alpha + beta)/2; % bisection
%             else
%                 done = 1;
%             end
%         else
%             if nexpand < nexpandmax
%                 nexpand = nexpand + 1;
%                 t = 2*alpha;  % still in expansion mode
%             else
%                 done = 1;
%             end
%         end 
%         x1=x0+t*dk;
%         f1=feval(nprob,n,x1,1);
%         g_new=feval(nprob,n,x1,2);     
%         NFF=NFF+1; 
%         K=K+1;
%     end % loop
%     
%     if success_flag==0
%         % Wolfe conditions not satisfied: there are two cases
%         if beta == inf % minimizer never bracketed
%             fail = -1;
%             %fprintf('Line search failed to bracket point satisfying weak ');
%             %fprintf('Wolfe conditions, function may be unbounded below\n')
%         else % point satisfying Wolfe conditions was bracketed
%             fail = 1;
%             %fprintf('Line search failed to satisfy weak Wolfe conditions')
%             %fprintf(' although point satisfying conditions was bracketed\n')
%         end
%     end
%     %%%%% End weak Wolfe line search %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
%%   wolfe线搜索
    while (j==0)&&(M<100)
        if (f1<=f+delta*a*g0)
            g_new=feval(nprob,n,x1,2);
            g1=g_new'*dk;
            NGG=NGG+1;
            if (g1>=b*g0)&&(g1<=-b*g0)
                j=-1;
            else
                aa=t+(t-a2)*g1/(g0-g1);
                a1=t;
                f=f1;
                g0=g1;
                t=aa;
            end
        else
            
            tt=(f-f1)/((t-a1)*g0);
            aa=a1+0.5*(t-a1)/(1+tt);
            a2=t;
            t=aa;
        end
        %%%%线搜索结束
        x1=x0+t*dk;
        f1=feval(nprob,n,x1,1);
        g_new=feval(nprob,n,x1,2);
        K=K+1;
        M=M+1;
        NFF=NFF+1;
    end

%%
    
    if f_new>epsilon
        stop=abs((f_new-f1)/f_new);
    else
        stop=abs(f_new-f1);
    end
    
    if (stop<=epsilon) % && (isnan(f1)==1)
        break;
    end
    
    
    gk11=feval(nprob,n,x0,2);
    x0=x1;
    %  f1=objfcn(n,m,x1,nprob);
    gk=g_new;
    yk=gk-gk11;
    switch method
        case 'FR'
            betak=(gk'*gk)/(gk11'*gk11);    % FR
        case 'DY'
            betak=(gk'*gk)/(yk'*dk);        % DY
        case 'LS'
            betak=-(gk'*yk)/(dk'*gk11);     % LS
        case 'HS'
            betak=(gk'*yk)/(yk'*dk);        % HS
        case 'PRP'
            betak=gk'*yk/norm(gk11)^2;    % PRP
        case 'JHJ'
            betak=gk'*gk-max([norm(gk,2)/norm(dk,2)*gk'*dk,0,norm(gk,2)/norm(gk11,2)*gk'*gk11])/ (yk'*dk);% JHJ
        case 'MHS'
            betak=gk'*(gk-norm(gk)/norm(gk11)*gk11)/(yk'*dk);% MHS 
        case 'WYL'
            betak=gk'*(gk-norm(gk)/norm(gk11)*gk11)/(gk11'*gk11); % WYL
        case 'JMJ'
            if gk'*dk>0
                betak=gk'*(gk-norm(gk)/norm(dk)*dk)/(yk'*dk);
            else
                betak=gk'*(gk+norm(gk)/norm(dk)*dk)/(yk'*dk);
            end   %JMJ
        case 'HL'
            betak=(norm(gk)^2-max(0,norm(gk)*gk'*gk11/norm(gk11)))/max(norm(gk11)^2,yk'*dk);
        case 'Mnew'
            mu=2;
            tauk=1-mu*min(0,gk'*dk/(norm(gk)*norm(dk)));
            betak=gk'*(gk-norm(gk)/norm(dk)*dk)/(tauk*norm(gk11)^2);
        case 'DY+'
            betak=max(0,min((gk'*yk)/(yk'*dk),(gk'*gk)/(yk'*dk)));
    end
    dk0=dk;
    NI=NI+1;
%    q=norm(g_new);
    dk=(-1)*gk+betak*dk0;
    t=t*(gk11'*dk0)/(g_new'*dk);
    if (g_new'*dk>epsilon)
        %           dk1=-g_new;
       x1=x0+t*(-g_new);
        %            g_new=grdfcn(n,m,x1,nprob);
    end
end
if (K+NI>=6000) %||(isnan(f1)==1)
    Tcpu=NaN;
    NFF=NaN;
    NGG=NaN;
    NI=NaN;
else
    Tcpu=toc;    
end




%    diary D:\Test.txt
%    fprintf('%d ,  %d ,  %d,     %d/%d/%d     %f %f \n',nprob,n,m,NI,NFF,NGG,x1(:,1),f1) ;
%    diary off
%    totaltime=Tcpu+totaltime


