% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

%  Brown and Dennis function  [16]
%  Dimensions:  n=4,  m=20
%  Function Definition:
%       f(x)=(x1 + t(i)x2- exp[t(i)])^2 +(x3 + x4sin(t(i))- cos(t(i)))^2
%       where t(i)=i/5
%  Standard starting point (25,5,-5,-1)
%  Minima of f=85822.2... if m=20
%
%  Revised  11/94               PLK
%

function out = bd(n,x,mode)

m=20;
two = 2.d0;
point2 = .2d0;
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
fvec=zeros(1,m);
J=zeros(m,4);

for i=1:m
        ti = (i)*point2;
        ei = exp(ti);
        si = sin(ti);
        ci = cos(ti);
        f1 = two*(x1 + ti*x2 - ei);
        f3 = two*(x3 + x4*si - ci);
        fvec(i) = (x1 + ti*x2 - ei)^2 + (x3 + x4*si - ci)^2;
        J( i, 1) = f1;
        J( i, 2) = f1 * ti;
        J( i, 3) = f3;
        J( i, 4) = f3 * si;
end
fvec=fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   gx = 2*fvec'*J ;
   out=gx';
end

    
