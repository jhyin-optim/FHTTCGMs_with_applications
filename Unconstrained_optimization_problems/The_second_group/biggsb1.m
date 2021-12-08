% Matlab Model by Qian Chen (Jan.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation. 

function out = biggsb1(n,x,mode)
N=n;
if mode==1
  fx=0;
  a=0;
  for i=1:N-1
      a=a+(x(i+1)-x(i))^2;
  end
  fx=(x(1)-1)^2+(1-x(N))^2+a;
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    gx(1)=2*(x(1)-1)-2*(x(2)-x(1));
    for i=2:N-1
        gx(i)=2*(x(i)-x(i-1))-2*(x(i+1)-x(i));
    end
    gx(N)=2*(x(N)-x(N-1))-2*(1-x(N));
    out=gx;
end