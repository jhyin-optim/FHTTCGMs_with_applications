% Matlab Model by Qian Chen (Nov.,2015,Yu Lin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation. 

function out = expenalty(n,x,mode)
N=n;
if mode==1
  fx=0;
  a=0;
  b=0;
  for i=1:N-1
      a=a+(x(i)-1)^2;
  end
  for j=1:N
      b=b+(x(j)^2-0.25);
  end
  fx=a+b^2;
  out=fx;
   elseif  mode==2
    gx = ones(N,1);
    d=0;
   for j=1:N
        d=d+(x(j)^2-0.25);
   end
   for i=1:N-1
        gx(i)=2*(x(i)-1)+4*x(i)*d;
    end
    gx(N)=4*x(N)*(x(N)^2-0.25);
    out=gx;
end