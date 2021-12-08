% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:  problem 21 in
%   J.J. More', B.S. Garbow and K.E. Hillstrom,
%   "Testing Unconstrained Optimization Software",
%   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

%   SIF input: Ph. Toint, Dec 1989.

%   classification SUR2-AN-V-0

% prob='srosenbr';


function out = srosenbr(n,x,mode) 

% N=10000;
N=n;
% var x{i in 1..N} := if (i mod 2 == 1) then -1.2 else 1;
%for i=1:N
%  if mod(i,2)==1
%     x(i)=-1.2;
%  else
%     x(i)=1;
%  end
%end

if mode==1
  fx=0;
  for i=1:N/2
      fx=fx+( 100*(x(2*i)-x(2*i-1)^2)^2 + (x(2*i-1)-1)^2 );
  end
  out = fx;
elseif mode==2
  gx = ones(N,1);
  for i=2:N/2
    gx(2*i-1)=-400*x(2*i-1)*(x(2*i)-x(2*i-1)^2)+2*(x(2*i-1)-1);
    gx(2*i)=200*(x(2*i)-x(2*i-1)^2);
  end  
  out = gx;
end

% minimize f:	sum {i in 1..N/2} ( 100*(x[2*i]-x[2*i-1]^2)^2 + (x[2*i-1]-1)^2 );
