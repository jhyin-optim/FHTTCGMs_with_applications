% Matlab Model by Qian Chen (Jan.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = fullhessianfh3(n,x,mode)
N=n;
if mode==1
  fx=0;
  a=0;
  b=0;
  for i=1:N
      a=a+x(i);
      b=b+x(i)*exp(x(i))-2*x(i)-x(i)^2;
  end
  fx=a^2+b;
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    c=0;
    for i=1:N
        c=c+x(i);
        gx(i)=exp(x(i))+x(i)*exp(x(i))-2-2*x(i)+2*c;
    end
    out=gx;
end