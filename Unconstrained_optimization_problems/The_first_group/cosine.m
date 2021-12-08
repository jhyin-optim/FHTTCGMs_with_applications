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
%   N. Gould, private communication.

%   SIF input: N. Gould, Jan 1996

%   classification OUR2-AN-V-0

% prob='cosine';

% N =10000;

%≥ı ºµ„
% x = 1.0*ones(N,1);

function out = cosine(n,x,mode) 

N=n;

if mode==1
    fx = sum(cos(-0.5*x(2:N)+x(1:N-1).^2));
    out = fx;
elseif mode==2
    gx = ones(N,1);
    gx(1)=-2*x(1)*sin(-0.5*x(2)+x(1)^2);
    for i=2:N-1
        gx(i)=0.5*sin(-0.5*x(i)+x(i-1)^2) - 2*x(i)*sin(-0.5*x(i+1)+x(i)^2);
    end
    gx(N)=0.5*sin(-0.5*x(N)+x(N-1)^2);
    out =gx;
end

% fx=0;
% for i=1:N-1
%   fx=fx+cos(-0.5*x(i+1)+x(i)^2);
% end