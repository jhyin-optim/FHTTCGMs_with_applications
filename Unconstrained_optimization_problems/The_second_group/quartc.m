% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:  problem 157 (p. 87) in
%   A.R. Buckley,
%   "Test functions for unconstrained minimization",
%   TR 1989CS-3, Mathematics, statistics and computing centre,
%   Dalhousie University, Halifax (CDN), 1989.

%   SIF input: Ph. Toint, March 1991.

%   classification OUR2-AN-V-0

% prob='quartc';

% N = 10000;

% x = 2.0*ones(N,1);

function out = quartc(n,x,mode) 

N=n;

if mode==1
  fx=0;
  for i=1:N
     fx = fx + (x(i)-i)^4;
  end
  out = fx;
elseif mode==2
  gx = ones(n,1);
  for i=1:N
    gx(i)=4*(x(i)-i)^3;
  end
  out = gx;
end
% minimize f:
%	sum {i in 1..N} (x[i]-i)^4;

