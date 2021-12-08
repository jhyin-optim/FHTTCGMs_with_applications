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
%   Ph.L. Toint,
%   "Some numerical results using a sparse matrix updating formula in
%   unconstrained optimization",
%   Mathematics of Computation, vol. 32(114), pp. 839-852, 1978.

%   See also Buckley#46 (n = 25) (p. 45).
%   SIF input: Ph. Toint, Dec 1989.

%   classification SUR2-AN-V-0

% prob='chnrosnb';

%initial point  x = -1.0*ones(n,1);

function out = chnrosnb(n,x,mode) 

% n = 50;

alph =[         1.25
                1.40
                2.40
                1.40
                1.75
                1.20
                2.25
                1.20
                1.00
                1.10
                1.50
                1.60
                1.25
                1.25
                1.20
                1.20
                1.40
                0.50
                0.50
                1.25
                1.80
                0.75
                1.25
                1.40
                1.60
                2.00
                1.00
                1.60
                1.25
                2.75
                1.25
                1.25
                1.25
                3.00
                1.50
                2.00
                1.25
                1.40
                1.80
                1.50
                2.20
                1.40
                1.50
                1.25
                2.00
                1.50
                1.25
                1.40
                0.60
                1.50 ];



if mode==1
    fx=0;
    for i=2:n
       fx=fx+(x(i-1)-x(i)^2)^2*16*alph(i)^2 +	(x(i)-1.0)^2;
    end
    out = fx;
elseif mode==2
    gx = ones(n,1);
    gx(1)= 2*(x(1)-x(2)^2)^2*16*alph(2)^2;
    gx(n)=-4*x(n)*(x(n-1)-x(n)^2)*16*alph(n)^2+2*(x(n)-1.0);
    for i=2:n-1
        gx(i)=-4*x(i)*(x(i-1)-x(i)^2)*16*alph(i)^2+2*(x(i)-1.0)+2*(x(i)-x(i+1)^2)*16*alph(i+1)^2;
    end
    out =gx;
end


    

    