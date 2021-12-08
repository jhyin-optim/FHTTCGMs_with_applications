% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 31 in
%   Ph.L. Toint,
%   "Test problems for partially separable optimization and results
%   for the routine PSPMIN",
%   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

%   See also Buckley%172 (p. 52)
%   SIF input: Ph. Toint and N. Gould, Dec 1989.

%   classification OUR2-AN-V-0

%prob='engval1';

%N = 5000;

% var x{1..N} := 2.0;
%x=2.0*ones(N,1);

function out = engval1(n,x,mode) 

N=n;

if mode==1
  fx=sum(-4*x+3.0);
  for i=1:N-1
    fx = fx +  (x(i)^2+x(i+1)^2)^2;
  end
  out=fx;
elseif mode==2
    gx = ones(n,1);
    gx(1)=4*(x(1)^2+x(2)^2)*x(1)-4;
    for i=2:N-1  
      gx(i)=4*(x(i-1)^2+x(i)^2)*x(i)+4*(x(i)^2+x(i+1)^2)*x(i)-4;
    end
    gx(N)=4*(x(N-1)^2+x(N)^2)*x(N);
    out = gx;
end

% minimize f:	sum {i in 1..N-1} (x[i]^2+x[i+1]^2)^2 + sum {i in 1..N-1} (-4*x[i]+3.0);