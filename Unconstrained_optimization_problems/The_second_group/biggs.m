% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.

% ******************************************
%  Biggs EXP6 function   [18]
%  Dimensions :  n=6,  m=13
%  Standard starting point (1,2,1,1,1,1)
%  Minima of f=5.65565...10^(-3)   if m=13
%            f=0 at (1,10,1,5,4,3)
%
%  Revised  11/94               PLK
% ******************************************


function out = biggs(n,x,mode)

m=13;
fvec=zeros(1,m);

t=zeros(1,m);
y=zeros(1,m);


for i = 1:m
    t(i) = .1*i;
    y(i) = exp(-t(i))-5*exp(-10*t(i))+3*exp(-4*t(i));
    fvec(i) = x(3)*exp(-t(i)*x(1))-x(4)*exp(-t(i)*x(2))+x(6)*exp(-t(i)*x(5))-y(i);
end;

fvec=fvec';

if mode==1
    fx=fvec' * fvec;
    out=fx;
elseif mode==2
    J=zeros(m,n);
    for i = 1:m
        t(i) = .1*i;
        y(i) = exp(-t(i))-5*exp(-10*t(i))+3*exp(-4*t(i));
        
        J(i,1)  = -t(i)*x(3)*exp(-t(i)*x(1));
        J(i,2)  =  t(i)*(x(4))*exp(-t(i)*x(2));
        J(i,3)  = exp(-t(i)*x(1));
        J(i,4)  = -exp(-t(i)*x(2));
        J(i,5)  = x(6)*(-t(i))*exp(-t(i)*x(5));
        J(i,6)  = exp(-t(i)*x(5));
    end;
    gx = 2*fvec'*J ;
    out=gx';
end



