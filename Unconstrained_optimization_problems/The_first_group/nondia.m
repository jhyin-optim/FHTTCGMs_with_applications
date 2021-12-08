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
%   D. Shanno,
%   " On Variable Metric Methods for Sparse Hessians II: the New
%   Method",
%   MIS Tech report 27, University of Arizona (Tucson, UK), 1978.

%   See also Buckley %37 (p. 76) and Toint %15.

%   SIF input: Ph. Toint, Dec 1989.

%   classification SUR2-AN-V-0

% prob='nondia';

function out = nondia(n,x,mode) 

N=n;

% N = 10000;

% x = -1*ones(N,1);

if mode==1
  fx = (x(1)-1)^2;
  for i=2:N
    fx = fx + 100*(x(1)-x(i-1)^2)^2;
  end
  out = fx;
elseif mode==2
  gx = ones(N,1);
  gx(1)=2*(x(1)-1)+200*(x(1)-x(1)^2)+sum(200*(x(1)-x(3:N-1).^2));
  for i=2:N-1
    gx(i)=-400*x(i)*(x(1)-x(i)^2);
  end
  gx(N)=0;
  out = gx;
end
% minimize f:
%	(x[1]-1)^2
%	+ sum {i in 2..N} 100*(x[1]-x[i-1]^2)^2;

