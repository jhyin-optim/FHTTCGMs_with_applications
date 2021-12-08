% Matlab Model by Jianghua Yin (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

function out = exdenschnb(n,x,mode)
N=n;
m=N/2;
if mode==1
    fx=0;
    for i=1:m
    fx=fx+(1+x(2*i)^2)*(x(2*i-1)-2)^2+(x(2*i)+1)^2;
    end
  out=fx;
  elseif  mode==2
    gx = ones(N,1);
    for i=1:m
        gx(2*i-1)=2*(x(2*i-1)-2)*(1+x(2*i)^2);
        gx(2*i)=2*x(2*i)*(x(2*i-1)-2)^2+2*(x(2*i)+1);
    end
    out=gx;
end