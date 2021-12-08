% Consider the problem to minimize f(x) over the whole space R^n,
% where the objective function f is continuously differentiable.
% Use nonlinear conjugate gradient methods (CGMs) with weak Wolfe¨CPowell (WWP)
% line search to solve the unconstrained optimization above.

% For WWP line search algorithm, we use a bisection algorithm similar to the following paper:
% Burke, J.V., Engle, A.: Line search methods for convex-composite optimization. 
% arXiv:1806.05218v1 (2018)
%
% Set the initial step length as 
% if k=0, then t0=norm(gk)^-1; otherwise, t0=tk*gk'*dk/(gk1'*dk1).
% see the following paper:
% Hu YF, Storey C. Global convergence result for conjugate gradient methods.
% J. Optim. Theory Appl. 1991, 71:399¨C405.
%
% In the case when an uphill search direction does occur,we restart 
% the algorithm by setting dk=-gk.
%
% Copyright (c), Jun, 2020, Jianghua Yin, Dept. Math., Guangxi University for Nationalities

function [Tcpu,NF,Ng,Itr,norm_gk] = CGMWWP(NO,para,method)

% format long
Itr = 0;  %% count the number of iterations
Itrmax = para.Itrmax;
NLmax = para.NLmax;
tic       %% start clock

%% Set initial point x0 and dimension n
[nprob,n,x0]=init(NO);

%% Set stopping precise
epsilon = para.epsilon;       % 10^-6
% varepsilon = para.varepsilon;    % 10^-6

%% Set line search parameters
delta = para.delta;  % fk1¡Üfk+delta*tk*gk'*dk;
sigma = para.sigma;  % gk1'*dk¡Ýsigma*gk'*dk;

%% Define the initial direction
gk = feval(nprob,n,x0,2);
Ng = 1;   %% count the number of gradient estimations
norm_gk = norm(gk);
if norm_gk < epsilon    
    Tcpu = toc;
    NF = 0;
    return;
end

% compute the initial direction
dk = (-1)*gk;
gkdk = gk'*dk;

%% Set the initial guess of steplength
tk_try = norm_gk^-1;

%% Compute initial function value
fk = feval(nprob,n,x0,1);
NF = 1;   %% count the number of function estimations

while Itr <= Itrmax
    tk_low = 0;    % lower bound on steplength conditions
    tk_up = inf;   % upper bound on steplength conditions
    x1 = x0+tk_try*dk;
    fk1 = feval(nprob,n,x1,1);
    NF = NF+1;
    gk1 = feval(nprob,n,x1,2);
    Ng = Ng+1;
    gk1dk = gk1'*dk;
    NL = 1;  % ÏßËÑË÷ÊÔÌ½´ÎÊý
    %%%%%%%%%% start the WWP line search %%%%%%%%%%
    while NL <= NLmax
        if fk1 > fk+delta*tk_try*gkdk        % If not sufficient decrease
            tk_up = tk_try;
        elseif gk1dk < sigma*gkdk          % Else if not curvature
            tk_low = tk_try;
        else
            break;
        end
        if tk_up==inf                      % Doubling Phase
            tk_try = 2*tk_try;
        else                               % Bisection Phase
            tk_try = (tk_low+tk_up)/2;     
        end
        x1 = x0+tk_try*dk;
        NL = NL+1;
        fk1 = feval(nprob,n,x1,1);
        NF = NF+1;
        gk1 = feval(nprob,n,x1,2);
        Ng = Ng+1;
        gk1dk = gk1'*dk;
    end
    %%%%%%%%%% end the WWP line search %%%%%%%%%%
    Itr = Itr+1;
%     % The follwing stopping criterion (Himmelblau rule) see the paper:
%     % Yuan, G.L., Wei, Z.X., Yang, Y.N.: The global convergence of the Polak¨CRibi¨¨re¨CPolyak conjugate
%     % gradient algorithm under inexact line search for nonconvex functions.
%     % J. Comput. Appl. Math. 2019, 362(15): 262-275
%     absfk = abs(fk);
%     if absfk>varepsilon
%         stop = abs(fk-fk1)/absfk;
%     else
%         stop = abs(fk-fk1);
%     end
%     if stop<varepsilon
%         norm_gk = norm(gk1);
%         break; 
%     end

    norm_gk1 = norm(gk1);
    if norm_gk1 < epsilon
        norm_gk = norm(gk1);
        break;
    end
%     sk = x1-x0;
    yk = gk1-gk;
    switch method
        case 'LS'
            betak = -(gk1'*yk)/gkdk;     % LS
            dk = -gk1+betak*dk;
        case 'HS'
            betak = (gk1'*yk)/(yk'*dk);        % HS
            dk = -gk1+betak*dk;
        case 'PRP'
            betak = (gk1'*yk)/norm_gk^2;
            dk = -gk1+betak*dk;
        case 'FHTTCGM_PRP'   
            eta = 0.4;
            lambdak = abs(gk1dk)/(norm_gk1*norm(dk));
            betak_DY = norm_gk1^2/(yk'*dk);
            norm_gk2 = norm_gk^2;
            betak_PRP = gk1'*yk/norm_gk2;
            betak_new = max(0,min(betak_PRP,betak_DY));
            thetak = eta*gk1'*gk/norm_gk2;
            dk = -gk1+(1-lambdak)*betak_new*dk-lambdak*thetak*gk;
        case 'FHTTCGM_HS'
            eta = 0.4;
            lambdak = abs(gk1dk)/(norm_gk1*norm(dk));
            betak_DY = norm_gk1^2/(yk'*dk);
            betak_HS = (gk1'*yk)/(yk'*dk);
            betak_new = max(0,min(betak_HS,betak_DY));
            thetak = eta*gk1'*gk/(norm_gk^2);
            dk = -gk1+(1-lambdak)*betak_new*dk-lambdak*thetak*gk;
        case 'FHTTCGM_LS'   
            eta = 0.4;
            lambdak = abs(gk1dk)/(norm_gk1*norm(dk));
            betak_DY = norm_gk1^2/(yk'*dk);
            betak_LS = -(gk1'*yk)/gkdk;
            betak_new = max(0,min(betak_LS,betak_DY));
            thetak = eta*gk1'*gk/(norm_gk^2);
            dk = -gk1+(1-lambdak)*betak_new*dk-lambdak*thetak*gk;
        case 'FHTTCGM_N'
            eta = 0.4;
            lambdak = abs(gk1dk)/(norm_gk1*norm(dk));
            betak_DY = norm_gk1^2/(yk'*dk);
            norm_gk2 = norm_gk^2;
            betak_N = gk1'*yk/(norm_gk2-sigma*gkdk);
            betak_new = max(0,min(betak_N,betak_DY));
            thetak = eta*gk1'*gk/norm_gk2;
            dk = -gk1+(1-lambdak)*betak_new*dk-lambdak*thetak*gk;
    end
    gk1dk1 = gk1'*dk;
    % the initial guess tk_try
    tk_try = tk_try*gkdk/gk1dk1;
    % In the case when an uphill search direction does occur,
    % update information
    x0 = x1;
    gk = gk1;
    norm_gk = norm_gk1;
    fk = fk1;
    gkdk = gk1dk1;
end
if Itr>Itrmax  % norm_gk>=epsilon || Itr>Itrmax
    Tcpu = NaN;
    NF = NaN;
    Ng = NaN;
    Itr = NaN;
    norm_gk = NaN;
else
    Tcpu = toc;
end
