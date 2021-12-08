% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 8 in
%   Ph.L. Toint,
%   "Test problems for partially separable optimization and results
%   for the routine PSPMIN",
%   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

%   See also Buckley%40 (p.96)

%   SIF input: Ph. Toint, Dec 1989.

%   classification QUR2-AN-V-0

% prob='tridia';

function out = tridia(n,x,mode) 

% N=10000;
N=n;

alpha=2.0;
beta=1.0;
gamma=1.0;
delta=1.0;

% x=ones(N,1);

if mode==1
   fx=gamma*(x(1)*delta-1.0)^2;
   for i=2:N
      fx=fx+i*(-beta*x(i-1)+alpha*x(i))^2;
   end
   out = fx;
elseif mode==2
   gx = ones(n,1);
   gx(1)=2*gamma*delta*(x(1)*delta-1.0)-4*beta*(-beta*x(1)+alpha*x(2));
   for i=2:N-1
     gx(i)=2*i*alpha*(-beta*x(i-1)+alpha*x(i))-2*(i+1)*beta*(-beta*x(i)+alpha*x(i+1));
   end
   gx(N)=2*N*alpha*(-beta*x(N-1)+alpha*x(N));
   out = gx;
end




% minimize f:	gamma*(x(1)*delta-1.0)^2 + sum {i in 2..N} i*(-beta*x[i-1]+alpha*x[i])^2;


