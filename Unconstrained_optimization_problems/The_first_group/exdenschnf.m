% Matlab Model by Jianghua Yin (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = exdenschnf(n,x,mode)
N=n;
m=N/2;
if mode==1
    fx=0;
    for i=1:m
    fx=fx+(2*(x(2*i-1)+x(2*i))^2+(x(2*i-1)-x(2*i))^2-8)^2+(5*x(2*i-1)^2+(x(2*i)-3)^2-9)^2;
    end
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    for i=1:m
        gx(2*i-1)=2*(2*(x(2*i-1)+x(2*i))^2+(x(2*i-1)-x(2*i))^2-8)*(6*x(2*i-1)+2*x(2*i))+20*x(2*i-1)*(5*x(2*i-1)^2+(x(2*i)-3)^2-9);
        gx(2*i)=2*(2*(x(2*i-1)+x(2*i))^2+(x(2*i-1)-x(2*i))^2-8)*(6*x(2*i)+2*x(2*i-1))+4*(5*x(2*i-1)^2+(x(2*i)-3)^2-9)*(x(2*i)-3);
    end
    out=gx;
end