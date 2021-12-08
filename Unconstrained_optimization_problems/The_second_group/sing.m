% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.

% ***************************************
% Powell singular function  [13]
% Dimensions:    n=4    m=4
% Function definitions:
%       f1(x)=x1 + 10x2
%       f2(x)= 5^.5*(x3 - x4)
%       f3(x)= (x2-2x3)^2
%       f4(x)= 10^.5*(x1-x4)^2
% Starting point: (3,-1,0,1)
% Minima of f=0 at the origin
%
% Coded in Matlab  October 31   PLK
% **************************************8


function out = sing(n,x,mode)

fvec =  [  x(1)+10*x(2)
    sqrt(5)*(x(3)-x(4))
    (x(2)-2*x(3))^2
    sqrt(10)*((x(1)-x(4))^2)  ] ;

if mode==1
    fx=fvec' * fvec;
    out=fx;
elseif mode==2
    J    =  [  1                           10       0                            0
        0                            0       sqrt(5)               -sqrt(5)
        0              2*(x(2)-2*x(3))      -4*(x(2)-2*x(3))              0
        2*sqrt(10)*(x(1)-x(4))       0       0      -2*sqrt(10)*(x(1)-x(4))];
    
    gx = 2*fvec'*J ;
    out=gx';
end


