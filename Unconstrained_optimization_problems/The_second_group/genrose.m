% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 5 in
%   S. Nash,
%   "Newton-type minimization via the Lanczos process",
%   SIAM J. Num. Anal. 21, 1984, 770-788.

%   SIF input: Nick Gould, Oct 1992.
%              minor correction by Ph. Shott, Jan 1995.

%   classification SUR2-AN-V-0

% prob='genrose';

% n = 500;


% var x =  1/(n+1)*ones(n,1);

function out = genrose(n,x,mode) 

if mode==1
   fx = 1.0;
   for i=2:n
       fx=fx+100*(x(i)-x(i-1)^2)^2;
   end
   for i=2:n
       fx=fx + (x(i)-1.0)^2; 
   end
   out = fx;
elseif mode==2
   gx = ones(n,1);
   gx(1)=-400*x(1)*(x(2)-x(1)^2);
   for i=2:n-1
      gx(i)=200*(x(i)-x(i-1)^2)-400*x(i)*(x(i+1)-x(i)^2)+2*(x(i)-1.0); 
   end
   gx(n)=200*(x(n)-x(n-1)^2)+2*(x(n)-1.0);
   out = gx;
end



% minimize f:
%	1.0 +
%	sum {i in 2..n} 100*(x[i]-x[i-1]^2)^2 +
%	sum {i in 2..n} (x[i]-1.0)^2;