% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:
%   G. Li,
%   "The secant/finite difference algorithm for solving sparse
%   nonlinear systems of equations",
%   SIAM Journal on Optimization, (to appear), 1990.

%   SIF input: Ph. Toint, Aug 1990.

%   classification SUR2-AN-V-0

% prob='liarwhd';

function out = liarwhd(n,x,mode) 
%N = 10000;
N=n;
% x = 4.0*ones(N,1);
if mode==1
    fx =  sum(4*(-x(1)+x.^2).^2)+sum((x-1.0).^2);
    out = fx;
elseif mode==2
    gx = ones(N,1);
    gx(1)=8*(-x(1)+x(1)^2)*(-1+2*x(1))+sum(-8*(-x(1)+x(2:N).^2))+2*(x(1)-1.0);
    for i=2:N
       gx(i)=16*x(i)*(-x(1)+x(i)^2)+2*(x(i)-1.0);
    end
    out = gx;
end


% minimize f:	sum {i in 1..N} 4*(-x[1]+x[i]^2)^2 + sum {i in 1..N} (x[i]-1.0)^2;
