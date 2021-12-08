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
%   An error in specifying problem CHNROSNB.
%   SIF input: Ph. Toint, Sept 1990.

%   classification SUR2-AN-V-0

% prob='errinros';

function out = errinros(n,x,mode) 

% N=50;
N=n;
alpha = [1.25;
 1.40;
 2.40;
 1.40;
 1.75;
 1.20;
 2.25;
 1.20;
 1.00;
 1.10;
 1.50;
 1.60;
 1.25;
 1.25;
 1.20;
 1.20;
 1.40;
 0.50;
 0.50;
 1.25;
 1.80;
 0.75;
 1.25;
 1.40;
 1.60;
 2.00;
 1.00;
 1.60;
 1.25;
 2.75;
 1.25;
 1.25;
 1.25;
 3.00;
 1.50;
 2.00;
 1.25;
 1.40;
 1.80;
 1.50;
 2.20;
 1.40;
 1.50;
 1.25;
 2.00;
 1.50;
 1.25;
 1.40;
 0.60;
 1.50];

% initial point x=-1*ones(N,1);

if mode==1
   fx = sum((x(2:N)-1.0).^2);
   for i=2:N
      fx = fx + (x(i-1)-16*alpha(i)^2*x(i)^2)^2;
   end
   out=fx;
elseif mode==2
    gx = ones(n,1);
    gx(1)=2*(x(1)-16*alpha(2)^2*x(2)^2);
    for i=2:N-1
      gx(i)=-64*alpha(i)^2*(x(i-1)-16*alpha(i)^2*x(i)^2)*x(i)+2*(x(i)-16*alpha(i+1)^2*x(i+1)^2)+2*(x(i)-1.0);
    end
    gx(N)=-64*alpha(N)^2*(x(N-1)-16*alpha(N)^2*x(N)^2)*x(N)+2*(x(N)-1.0);
    out=gx;
end

% minimize f:sum {i in 2..N} (x[i-1]-16*alpha[i]^2*x[i]^2)^2
%	+sum {i in 2..N} (x[i]-1.0)^2
