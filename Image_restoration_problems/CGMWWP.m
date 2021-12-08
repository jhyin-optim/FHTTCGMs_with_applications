function [Itr,u1] = CGMWWP(u,N,V,imgn,para,method,xs)%para,method,xs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Itr = 0;  %% count the number of iterations
Itrmax = para.Itrmax;
NLmax = para.NLmax;
alpha = para.alpha; 

%% Set stopping precise
Tol = para.Tol;

%% Set line search parameters
delta = para.delta;  % fk1≤fk+delta*tk*gk'*dk;
sigma = para.sigma;  % gk1'*dk≥sigma*gk'*dk;

%% Define the initial direction
gk = FG(N,V,imgn,u,alpha,2); 
norm_gk = norm(gk);
dk = (-1)*gk;
gkdk = gk'*dk; 

%% Set the initial guess of steplength
tk_try = norm_gk^-1;

%% Compute initial function value
fk = FG(N,V,imgn,u,alpha,1); %fk = feval(nprob,n,x0,1);

while Itr <= Itrmax  
    
    if xs==1
%%    %%%%%%%%%% start the WWP line search %%%%%%%%%%
        tk_low = 0;    % lower bound on steplength conditions
        tk_up = inf;   % upper bound on steplength conditions
        u1 = u+tk_try*dk;
        fk1 = FG(N,V,imgn,u1,alpha,1);
        gk1 = FG(N,V,imgn,u1,alpha,2);
        gk1dk = gk1'*dk;
        NL = 1;                       
        while NL <= NLmax
            if fk1 > fk+delta*tk_try*gkdk        % If not sufficient decrease
                tk_up = tk_try;
            elseif gk1dk < sigma*gkdk    % Else if not curvature
                tk_low = tk_try;
            else
                break;
            end
            if tk_up==inf                      % Doubling Phase
                tk_try = 2*tk_try;
            else                               % Bisection Phase
                tk_try = (tk_low+tk_up)/2;     
            end
            u1 = u+tk_try*dk;
            NL = NL+1;
            fk1 = FG(N,V,imgn,u1,alpha,1);%feval(nprob,n,x1,1);
            gk1 = FG(N,V,imgn,u1,alpha,2);%feval(nprob,n,x1,2);
            gk1dk = gk1'*dk;
        end
%%    %%%%%%%%%% end the WWP line search %%%%%%%%%%
    else
%%    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%步长计算公式%%%%%%%%%%%%%%%
        delta = sqrt(alpha-1)/16;
        dkQkdk = dk'*dk;
        tk = - delta*gk'*dk/dkQkdk; 
        u1 = u+tk*dk;
        fk1 = FG(N,V,imgn,u1,alpha,1);
        gk1 = FG(N,V,imgn,u1,alpha,2);
    end
    Itr = Itr+1;
%%    %%%%%%%%%%%%%%%%%%% Stopping Criterion %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    if abs(fk1-fk) < Tol*abs(fk1) 
         break;
    end
%%
    yk = gk1-gk;
    gk1yk = gk1'*yk;
    norm_gk1 = norm(gk1);
    switch method
        case 'PRP'
            betak = gk1yk/(norm_gk^2);
            dk = -gk1+betak*dk;
        case 'HZ' 
            eta = 0.01;
            ykdk = yk'*dk;
            betak_N = gk1yk/ykdk-2*norm(yk)^2*gk1dk/ykdk^2;
            etak = -1/(norm(dk)*min(eta,norm_gk));
            betak_barN = max(betak_N,etak);
            dk = -gk1+betak_barN*dk;
        case 'FHTTCGM_N'     
            eta = 0.4;
            lambdak = abs(gk1dk)/(norm_gk1*norm(dk));
            betak_DY = norm_gk1^2/(yk'*dk);
            norm_gk2 = norm_gk^2;
            betak_N = gk1yk/(norm_gk2-sigma*gkdk);
            betak_new = max(0,min(betak_N,betak_DY));
            thetak = eta*gk1'*gk/norm_gk2;
            dk = -gk1+(1-lambdak)*betak_new*dk-lambdak*thetak*gk;
    end
%% update the initial guess tk_try
    gk1dk1 = gk1'*dk;
    tk_try = tk_try*gkdk/gk1dk1; 
%% update information
    u = u1;
    gk = gk1;
    norm_gk = norm_gk1;
    fk = fk1;
    gkdk = gk1dk1;
end

