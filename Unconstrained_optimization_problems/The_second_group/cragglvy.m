% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:  problem 32 in
%   Ph. L. Toint,
%   "Test problems for partially separable optimization and results
%   for the routine PSPMIN",
%   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

%   See  also Buckley#18
%   SIF input: Ph. Toint, Dec 1989.

%   classification OUR2-AY-V-0

function out = cragglvy(n,x,mode) 

m = 2499;
% n = 2*m+2;

if mode==1
  fx=0;
  for i=1:m
    fx=fx+exp(x(2*i-1)-x(2*i))^4+100*(x(2*i)-x(2*i+1))^6+(tan(x(2*i+1)-x(2*i+2))+x(2*i+1)-x(2*i+2))^4 + (x(2*i-1))^8 + (x(2*i+2)-1.0)^2;
  end
  out = fx;
elseif mode==2
   gx = ones(n,1);
   gx(1)=4*(exp(x(1))-x(2))^3*exp(x(1))+8*x(1)^7;
   gx(2)=-4*(exp(x(1))-x(2))^3+600*(x(2)-x(3))^5;
   for i=2:m
     gx(2*i-1)=4*(exp(x(2*i-1))-x(2*i))^3*exp(2*i-1)-600*(x(2*i-2)-x(2*i-1))^5+ ...
               4*(tan(x(2*i-1)-x(2*i))+x(2*i-1)-x(2*i))^3*((sec(x(2*i-1)-x(2*i)))^2+1)+8*x(2*i-1)^7;
     gx(2*i)=-4*(exp(x(2*i-1))-x(2*i))^3+600*(x(2*i)-x(2*i+1))^5-4*(tan(x(2*i-1)-x(2*i))+x(2*i-1)-x(2*i))^3*...
               ((sec(x(2*i-1)-x(2*i)))^2+1)+2*(x(2*i)-1.0);
   end
   gx(2*m+1)=-600*(x(2*m)-x(2*m+1))^5+4*(tan(x(2*m+1)-x(2*m+2))+x(2*m+1)-x(2*m+2))^3*((sec(x(2*m+1)-x(2*m+2)))^2+1);
   gx(2*m+2)=-4*(tan(x(2*m+1)-x(2*m+2))+x(2*m+1)-x(2*m+2))^3*((sec(x(2*m+1)-x(2*m+2)))^2+1)+2*(x(2*m+2)-1.0);
   out = gx;
end


