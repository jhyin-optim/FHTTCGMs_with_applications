% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:  problem 8 in
%   A.R.Conn,N.I.M.Gould and Ph.L.Toint,
%   "Testing a class of methods for solving minimization 
%   problems with simple bounds on their variables, 
%   Mathematics of Computation 50, pp 399-430, 1988.

%   SIF input: Nick Gould and Ph. Toint, Dec 1995.

%   classification SUR2-AN-V-0

% prob='chainwoo';

% initial point
%x = [-3.0;-1.0;-3.0;-1.0;-2.0*zeros(n-4,1)];

function out = chainwoo(n,x,mode)

ns = 499;
n = 2*ns + 2;


if mode==1
    fx = 1.0;
    for i=1:ns
       fx = fx + 100*(x(2*i)-x(2*i-1)^2)^2 + 	(1.0-x(2*i-1))^2 + 90*(x(2*i+2)-x(2*i+1)^2)^2 + (1.0-x(2*i+1))^2 + 10*(x(2*i)+x(2*i+2)-2.0)^2 + (x(2*i)-x(2*i+2))^2/10;
    end
    out = fx;
elseif mode==2
    gx = ones(n,1);
    gx(1)=-400*(x(2)-x(1)^2)*x(1)-2*(1.0-x(1));
    for i=2:ns
       gx(2*i-1)=-760*(x(2*i)-x(2*i-1)^2)*x(2*i-1)-4*(1.0-x(2*i-1));
       gx(2*i)=380*(x(2*i)-x(2*i-1)^2)+20*(x(2*i-2)+2*x(2*i)+x(2*i+2)-4.0)+(2*x(2*i)-x(2*i-2)-x(2*i+2))/5;
    end
    gx(2*ns+1)=-360*(x(2*ns+2)-x(2*ns+1)^2)*x(2*ns+1)-2*(1.0-x(2*ns+1));
    gx(2*ns+2)=180*(x(2*ns+2)-x(2*ns+1)^2)+20*(x(2*ns)+x(2*ns+2)-2.0)-(x(2*ns)-x(2*ns+2))/5;
    out = gx;
end
    
