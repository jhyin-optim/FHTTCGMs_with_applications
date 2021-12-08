% Matlab Model by Jianghua Yin (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.    


function out = errinrsm(n,x,mode)
N=n;
if mode==1
  fx=0;
  for i=2:N
      fx=fx+(x(i-1)-16*x(i)^2*(1.5+sin(i))^2)^2+(x(i)-1)^2;
  end
  out=fx;
elseif  mode==2
    gx = ones(N,1);
    gx(1)=2*(x(1)-16*x(2)^2*(1.5+sin(2))^2);
    for i=2:N-1
      gx(i)=2*(x(i)-16*x(i+1)^2*(1.5+sin(i+1))^2)-64*x(i)*(x(i-1)-16*x(i)^2*(1.5+sin(i))^2)*(1.5+sin(i))^2+2*(x(i)-1);
    end
    gx(N)=-64*x(N)*(x(N-1)-16*x(N)^2*(1.5+sin(N))^2)*(1.5+sin(N))^2+2*(x(N)-1);
    out=gx;
end