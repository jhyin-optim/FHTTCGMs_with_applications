% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

% Brown badly scaled function 
% --------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem no. 4
% Dimensions -> n=2, m=3              
% Standard starting point -> x=(1,1)  
% Minima -> f=0 at (1e+6,2e-6)        

% prob='badscb'
% x0=[0.5,-2]';
% n=2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = badscb(n,x,mode)

fvec = [  x(1)-10^6
          x(2)-(2e-6)
          x(1)*x(2)-2  ]  ;
if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
    J    = [  1      0
              0      1
            x(2)   x(1)  ] ;
    gx = 2*fvec'*J ;
    out=gx';
end
