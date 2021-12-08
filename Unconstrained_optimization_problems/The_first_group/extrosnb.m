% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 10 in
%   Ph.L. Toint,
%   "Test problems for partially separable optimization and results
%   for the routine PSPMIN",
%   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

%   See also Buckley%116.  Note that MGH%21 is the separable version.
%   SIF input: Ph. Toint, Dec 1989.

%   classification SUR2-AN-V-0

% prob='extrosnb';

function out = arwhead(n,x,mode) 

N=n;

% N=10;

% initial point x=ones(N,1);

if mode==1
   fx=(x(1)-1)^2;
   for i=2:N
     fx = fx + 100*(x(i)-x(i-1)^2)^2;
   end
   out = fx;
elseif mode==2
    gx = ones(N,1);
    gx(1)=2*(x(1)-1)-400*x(1)*(x(2)-x(1)^2);
    for i=2:N-1
      gx(i)=200*(x(i)-x(i-1)^2)-400*x(i)*(x(i+1)-x(i)^2);
    end
    gx(N)=200*(x(N)-x(N-1)^2);
    out=gx;
end


% minimize f:
%	(x[1]-1)^2 + sum {i in 2..N} 100*(x[i]-x[i-1]^2)^2;
