% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: Problem 55 in
%   A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
%   "Performance of a multifrontal scheme for partially separable
%   optimization",
%   Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.

%   SIF input: Ph. Toint, Dec 1989.

%   classification OUR2-AN-V-0


% prob='arwhead';
% N = 5000;
% x = ones(N,1)


function out = arwhead(n,x,mode) 

N=n;

if mode==1
    fx = sum(-4*x+3.0) + sum((x(1:N-1).^2+x(N)^2).^2);
    out = fx;
elseif mode==2
    gx = ones(n,1);
    for i=1:N-1
      gx(i)=-4+4*x(i)*(x(i)^2+x(N)^2);
    end
    gx(N)=0;
    for i=1:N-1
       gx(N)=gx(N)+4*x(N)*(x(i)^2+x(N)^2);
    end
    out = sparse(gx);
end
   


% minimize f:	sum {i in 1..N-1} (-4*x[i]+3.0) + sum {i in 1..N-1} (x[i]^2+x[N]^2)^2;