% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source: problem 22 in
%   Ph. L. Toint,
%   "Test problems for partially separable optimization and results
%   for the routine PSPMIN",
%   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

%   SIF input: Ph. Toint, Dec 1989.

%   classification QUR2-AN-V-0

% prob='dqdrtic';

function out = dqdrtic(n,x,mode) 

% N = 5000;
N=n;
% initial point x=3.0*ones(N,1);

if  mode==1
   fx=0;
   for i=1:N-2
      fx=fx+(100*x(i+1)^2+100*x(i+2)^2+x(i)^2);
   end
   out = fx;
elseif mode==2
   gx = ones(N,1);
   gx(1)=2*x(1);
   gx(2)=202*x(2);
   for i=3:N-2
     gx(i)=402*x(i);
   end
   gx(N-1)=400*x(N-1);
   gx(N)=200*x(N);
   out = gx;
end


% minimize f:	sum {i in 1..N-2} (100*x[i+1]^2+100*x[i+2]^2+x[i]^2);

