% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:  The second problem given by
%   R. Fletcher,
%   "An optimal positive definite update for sparse Hessian matrices"
%   Numerical Analysis report NA/145, University of Dundee, 1992.

%   SIF input: Nick Gould, Oct 1992.

%   classification OUR2-AN-V-0

% prob='fletchcr';

function out = fletchcr(n,x,mode) 
N=n;
% N = 100;

% initial point x=zeros(N,1);

if mode==1
  fx=0;
  for i=1:N-1
    fx=fx+100*(x(i+1)-x(i)^2)^2+(1+x(i))^2;  %modified by Jianghua Yin, original fx=fx+100*(x(i+1)-x(i)+1-x(i)^2)^2 by Lin Han
  end
  out = fx;
elseif mode==2
  gx = ones(n,1);
  gx(1)=-400*x(1)*(x(2)-x(1)^2)+2*(1+x(1)); %modified by Jianghua Yin, original gx(1)=-200*(x(2)-x(1)+1-x(1)^2)*(1+2*x(1)) by Lin Han
  for i=2:N-1
    gx(i)=200*(x(i)-x(i-1)^2)-400*x(i)*(x(i+1)-x(i)^2)+2*(1+x(i));  %modified by Jianghua Yin, original gx(i)=200*(x(i)-x(i-1)+1-x(i-1)^2)-200*(x(i+1)-x(i)+1-x(i)^2)*(1+2*x(i)) by Lin Han
  end
  gx(N)=200*(x(N)-x(N-1)^2); %modified by Jianghua Yin, original gx(N)=200*(x(N)-x(N-1)+1-x(N-1)^2) by Lin Han
  out = gx;
end
% minimize f:	sum {i in 1..N-1} 100*(x[i+1]-x[i]+1-x[i]^2)^2;
