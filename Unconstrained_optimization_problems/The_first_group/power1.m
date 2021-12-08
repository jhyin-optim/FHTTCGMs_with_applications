% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     

%   Source:
%   S.S. Oren,
%   Self-scaling variable metric algorithms,
%   Part II: implementation and experiments"
%   Management Science 20(5):863-874, 1974.

%   See also Buckley%179 (p. 83)

%   SIF input: Ph. Toint, Dec 1989.

%   classification OUR2-AN-V-0

% prob='power';

% N = 1000;
% x = 1.0*ones(N,1);

function out = power1(n,x,mode) 
N=n;

if mode==1
  fx=0;
  for i=1:N
    fx=fx+(i*x(i))^2; 
  end
  out = fx;
elseif mode==2
  gx = ones(n,1);
  for i=1:N
    gx(i)=2*i*(i*x(i));
  end
  out = gx;
end

% minimize f:
%	sum {i in 1..N} (i*x[i])^2; 
