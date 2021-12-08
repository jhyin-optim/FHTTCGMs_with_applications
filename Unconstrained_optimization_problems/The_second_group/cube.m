% Matlab Model by Qian Chen (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = cube(n,x,mode)
N=n;
if mode==1
  fx=0;
  a=0;
  for i=2:N
      a=a+100*(x(i)-x(i)^3)^2;
  end
  fx=a+(x(1)-1)^2;
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    gx(1)=2*(x(1)-1)-600*x(1)^2*(x(2)-x(1)^3);
    for i=2:N-1
    gx(i)=200*(x(i)-x(i-1)^3)-600*x(i)^2*(x(i+1)-x(i)^3);
    end
    gx(N)=200*(x(N)-x(N-1)^3);
    out=gx;
end