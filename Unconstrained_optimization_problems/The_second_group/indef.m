% Matlab Model by Qian Chen (Jan.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = indef(n,x,mode)
N=n;
if mode==1
  fx=0;
  a=0;
  b=0;
  for i=1:N
      a=a+x(i);
  end
  for i=2:N-1
     b=b+1/2*cos(2*x(i)-x(N)-x(1));
  end
  fx=a+b;
  out=fx;
  elseif  mode==2
      gx = ones(N,1);
      c=0;
      d=0;
      e=0;
      for i=2:N-1
         c=c+1/2*sin(2*x(i)-x(N)-x(1));
      end
      gx(1)=1+c;
      for i=2:N-1
          d=d+sin(2*x(i)-x(N)-x(1));
      end
      gx(i)=1-d;
      for i=2:N-1
          e=e+1/2*sin(2*x(i)-x(N)-x(1));
      end
      gx(N)=1+e;
      out=gx;
end
          