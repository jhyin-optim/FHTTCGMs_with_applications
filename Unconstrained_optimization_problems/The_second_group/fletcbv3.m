% Matlab Model by Jianghua Yin (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out = fletcbv3(n,x,mode) 
N=n;
% N = 100;

% initial point x=zeros(N,1);

p=1/10^8;
h=1/(1+N);
c=1;
if mode==1
  fx=0;
  a=0;
  b=0;
  for i=1:N-1
    a=a+p/2*(x(i)-x(i+1))^2;
  end
  for i=1:N
      b=b+p*(h^2+2)/h^2*x(i)+c*p/h^2*cos(x(i));
  end
  fx=1/2*p*(x(1)^2+x(N)^2)+a-b;
  out = fx;
elseif mode==2
  gx = ones(N,1);
  gx(1)=p*(2*x(1)-x(2))-p*(h^2+2)/h^2+c*p/h^2*sin(x(1)); 
  for i=2:N-1
    gx(i)=p*(2*x(i)-x(i-1)-x(i+1))-p*(h^2+2)/h^2+c*p/h^2*sin(x(i)); 
  end
  gx(N)=p*(2*x(N)-x(N-1))-p*(h^2+2)/h^2+c*p/h^2*sin(x(N)); 
  out = gx;
end
% minimize f:	sum {i in 1..N-1} 100*(x[i+1]-x[i]+1-x[i]^2)^2;
