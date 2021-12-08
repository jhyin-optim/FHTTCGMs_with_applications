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
%   Ph. Toint, private communication, 1997.

%   SDIF input: N. Gould and Ph. Toint, November 1997.

%   classification SUR2-AN-V-0

% prob='genhumps';



function out = genhumps(n,x,mode) 

zeta = 2;

N=n;
% x = [-506.0; 506.2*ones(N-1,1)];

if mode==1
   fx=0;
   for i=1:N-1
      fx=fx+sin((zeta*x(i))^2)*sin((zeta*x(i+1))^2)+0.05*(x(i)^2+x(i+1)^2) ;
   end
   out = fx;
elseif mode==2
   gx = ones(n,1);
   gx(1)=2*zeta^2*x(1)*cos(zeta*x(1))^2*sin(zeta*x(2))^2+0.1*x(1);
   for i=2:N-1
     gx(i)=2*zeta^2*x(i)*cos(zeta*x(i))^2*sin(zeta*x(i-1))^2+0.2*x(i)+2*zeta^2*x(i)*cos(zeta*x(i))^2*sin(zeta*x(i+1))^2;
   end
   gx(N)=2*zeta^2*x(N)*cos(zeta*x(N))^2*sin(zeta*x(N-1))^2+0.1*x(N);
   out = gx;
end

% minimize f:
%	sum {i in 1..N-1} ( sin (zeta*x[i])^2*sin(zeta*x[i+1])^2+0.05*(x[i]^2+x[i+1]^2) );
