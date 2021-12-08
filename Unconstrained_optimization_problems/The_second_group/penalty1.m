% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:  Problem 23 in
%   J.J. More', B.S. Garbow and K.E. Hillstrom,
%   "Testing Unconstrained Optimization Software",
%   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

%   See also Buckley %181 (p. 79).

%   SIF input: Ph. Toint, Dec 1989.

%   classification SUR2-AN-V-0

% prob='penalty1';

function out = penalty1(n,x,mode) 

N=n;
% N = 1000;
% M = N+1;

% x = [1:N]';

a = 10^(-5);

if mode==1
   fx=0;
   for i=1:N
      fx=fx+a*(x(i)-1)^2;
   end
   g=-0.25;
   for j=1:N
      g=g+x(j)^2;
   end
   fx=fx+g^2;
   out = fx;
elseif mode==2
   gx = ones(N,1);
   for i=1:N
     gx(i)=2*a*(x(i)-1)+4*x(i)*(sum(x.^2)-0.25);
   end 
   out = gx;
end

% minimize f:
%	sum {i in 1..N} a*(x[i]-1)^2 + ( sum {j in 1..N} x[j]^2 - 1/4 )^2;