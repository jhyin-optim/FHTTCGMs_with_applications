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

%   SIF input: Ph. Toint, Apr 1990.
%              minor correction by Ph. Shott, January 1995.

%   classification OUR2-AN-V-0

% prob='edensch';

%N = 2000;


% initial point var x{1..N} := 0.0;
% x = zeros(N,1);

function out = edensch(n,x,mode) 

N=n;

if mode==1
   fx=16;
   for i=1:N-1
     fx=fx+ ((x(i)-2)^4 + (x(i)*x(i+1)-2*x(i+1))^2 + (x(i+1)+1)^2 ) ;
   end
   out = fx;
elseif mode==2
   gx = ones(n,1);
   gx(1)=4*(x(1)-2)^3+2*x(2)*(x(1)*x(2)-2*x(2));
   for i=2:N-1
     gx(i)=2*(x(i-1)*x(i)-2*x(i))*(x(i-1)-2)+2*(x(i)+1)+4*(x(i)-2)^3+2*x(i+1)*(x(i)*x(i+1)-2*x(i+1));
   end
   gx(N)=2*(x(N-1)*x(N)-2*x(N))*(x(N-1)-2)+2*(x(N)+1);
   out=gx;
end


% minimize f:	sum {i in 1..N-1} ( (x[i]-2)^4 + (x[i]*x[i+1]-2*x[i+1])^2 + (x[i+1]+1)^2 ) + 16;

