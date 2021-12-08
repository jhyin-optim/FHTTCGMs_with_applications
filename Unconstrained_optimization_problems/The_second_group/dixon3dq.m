% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 156 (p. 51) in
%   A.R. Buckley,
%   "Test functions for unconstrained minimization",
%   TR 1989CS-3, Mathematics, statistics and computing centre,
%   Dalhousie University, Halifax (CDN), 1989.

%   SIF input: Ph. Toint, Dec 1989.

%   classification QUR2-AN-V-0

% prob='dixon3dq';

function out = dixon3dq(n,x,mode) 

% n = 10;

% initial point x=-1.0*ones(n,1);

if mode==1
   fx = (x(1)-1.0)^2+ (x(n)-1.0)^2;
   for j=2:n-1
      fx=fx+(x(j)-x(j+1))^2 ;
   end
   out = fx;
elseif mode==2
   gx = ones(n,1);
   gx(1) = 2*(x(1)-1.0);
   gx(2) = 2*(x(2)-x(3));
   for i=3:n-1
     gx(i)=-2*(x(i-1)-x(i))+2*(x(i)-x(i+1));
   end
   gx(n)=-2*(x(n-1)-x(n))+2*(x(n)-1.0);
   out = gx;
end
