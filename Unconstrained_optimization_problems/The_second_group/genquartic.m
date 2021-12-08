% Matlab Model by Qian Chen (Jan.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = genquartic(n,x,mode)
N=n;
if mode==1
  fx=0;
  for i=1:N-1
      fx=fx+x(i)^2+(x(i+1)+x(i)^2)^2;
  end
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    gx(1)=2*x(1)+4*x(1)*(x(2)+x(1)^2);
    for i=2:N-1
        gx(i)=2*(x(i)+x(i-1)^2)+2*x(i)+4*x(i)*(x(i+1)+x(i)^2);
    end
    gx(N)=2*(x(N)+x(N-1)^2);
    out=gx;
end