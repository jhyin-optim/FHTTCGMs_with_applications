% Matlab Model by Qian Chen (Jan.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = bdexp(n,x,mode)
N=n;
if mode==1
  fx=0;
  for i=1:N-2
      fx=fx+(x(i)+x(i+1))*exp(-x(i+2)*(x(i)+x(i+1)));
  end
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    gx(1)=exp(-x(3)*(x(1)+x(2)))-x(3)*(x(1)+x(2))*exp(-x(3)*(x(1)+x(2)));
    gx(2)=exp(-x(3)*(x(1)+x(2)))-x(3)*(x(1)+x(2))*exp(-x(3)*(x(1)+x(2)))+exp(-x(4)*(x(2)+x(3)))-x(4)*(x(2)+x(3))*exp(-x(4)*(x(2)+x(3)));
    for i=3:N-2
        gx(i)=exp(-x(i+1)*(x(i-1)+x(i)))-x(i+1)*(x(i-1)+x(i))*exp(-x(i+1)*(x(i-1)+x(i)))+exp(-x(i+2)*(x(i)+x(i+1)))-x(i+2)*(x(i)+x(i+1))*exp(-x(i+2)*(x(i)+x(i+1)))-(x(i-2)+x(i-1))^2*exp(-x(i)*(x(i-2)+x(i-1)));
    end
    gx(N-1)=-(x(N-3)+x(N-2))^2*exp(-x(N-1)*(x(N-3)+x(N-2)))+exp(-x(N)*(x(N-2)+x(N-1)))-x(N)*(x(N-2)+x(N-1))*exp(-x(N)*(x(N-2)+x(N-1)));
    gx(N)=-(x(N-2)+x(N-1))^2*exp(-x(N)*(x(N-2)+x(N-1)));
    out=gx;
end