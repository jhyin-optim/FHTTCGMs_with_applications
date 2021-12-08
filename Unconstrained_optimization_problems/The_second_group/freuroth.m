% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 2 in
%   J.J. More', B.S. Garbow and K.E. Hillstrom,
%   "Testing Unconstrained Optimization Software",
%   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

%   See also Toint%33, Buckley%24
%   SIF input: Ph. Toint, Dec 1989.

%   classification SUR2-AN-V-0

% prob='freuroth';

function out = freuroth(n,x,mode) 

% n = 5000;
ngs = n-1;

% x = [0.5; -2.0; zeros(n-2,1)];

if mode==1
  fx = 0;
  for i=1:ngs
    fx = fx + ((5.0-x(i+1))*x(i+1)^2+x(i)-2*x(i+1)-13.0)^2; 
  end
  for i=1:ngs
    fx = fx + ((1.0+x(i+1))*x(i+1)^2+x(i)-14*x(i+1)-29.0)^2;
  end
  out = fx;
elseif mode==2
  gx = ones(n,1);
  gx(1) = 2*((5.0-x(2))*x(2)^2+x(1)-2*x(2)-13.0)+2*((1.0+x(2))*x(2)^2+x(1)-14*x(2)-29.0);
  for i=2:ngs
    gx(i)=2*((5.0-x(i))*x(i)^2+x(i-1)-2*x(i)-13.0)*(-x(i)^2+2*(5.0-x(i))*x(i)-2)+2*((5.0-x(i+1))*x(i+1)^2+x(i)-2*x(i+1)-13.0)...
+2*((1.0+x(i))*x(i)^2+x(i-1)-14*x(i)-29.0)*(x(i)^2+2*(1.0+x(i))*x(i)-14)+2*((1.0+x(i+1))*x(i+1)^2+x(i)-14*x(i+1)-29.0);
  end
  gx(ngs+1)=2*((1.0+x(ngs+1))*x(ngs+1)^2+x(ngs)-14*x(ngs+1)-29.0)*(x(ngs+1)^2+2*(1.0+x(ngs+1))*x(ngs+1)-14)+...
2*((5.0-x(ngs+1))*x(ngs+1)^2+x(ngs)-2*x(ngs+1)-13.0)*(-3*x(ngs+1)^2+10*x(ngs+1)-2);
  out = gx;
end


% minimize f:
%	sum {i in 1..ngs} ((5.0-x[i+1])*x[i+1]^2+x[i]-2*x[i+1]-13.0)^2 +
%	sum {i in 1..ngs} ((1.0+x[i+1])*x[i+1]^2+x[i]-14*x[i+1]-29.0)^2;