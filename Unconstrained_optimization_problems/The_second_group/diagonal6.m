% Matlab Model by Qian Chen (Jan.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.

function out = diagonal6(n,x,mode)
N=n;
if mode==1
  fx=0;
  for i=1:N
      fx=fx+exp(x(i))-(1-x(i));
  end
  out=fx;
   elseif  mode==2
    gx = ones(N,1);
    for i=1:N
        gx(i)=exp(x(i))+1;
    end
    out=gx;
end
      