% Matlab Model by Qian Chen (Jan.,2015,Yu Lin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation. 

% Discrete integral equation function
% ----------------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable, m=n
% Standard starting point -> x=(s(j)) where
%                            s(j)=t(j)*(t(j)-1) where
%                            t(j)=j*h & h=1/(n+1)
% Minima -> f=0 
%                                     
% 12/4/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = explin1(n,x,mode)
N=n;
if mode==1
  fx=0;
a=0;
b=0;
for i=1:N-1
    a=a+exp(0.1*x(i)*x(i+1));
end
for i=1:N
    b=b+i*x(i);
end
fx=a-10*b;
out=fx;
elseif  mode==2
    gx = ones(N,1);
    gx(1)=0.1*x(2)*exp(0.1*x(1)*x(2))-10;
    for i=2:N-1
        gx(i)=0.1*x(i-1)*exp(0.1*x(i-1)*x(i))+0.1*x(i+1)*exp(0.1*x(i)*x(i+1))-10*i;
    end
    gx(N)=0.1*x(N-1)*exp(0.1*x(N-1)*x(N))-10*N;
    out=gx;
end