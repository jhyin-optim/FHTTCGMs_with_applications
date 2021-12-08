% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

% **********************************
% Linear function - rank 1   [33]
% Dimensions:  n variable,    m>=n
% Standard starting point: (1,....,1)
% Minima of f=[(m(m-1))/(2(2m+1))]
%
% Coded in MATLAB    11/94      PLK
% **********************************

function out = lin1(n,x,mode)
m=500;
J=zeros(m,n);
fvec=zeros(1,m);
opt=3;
for i = 1:m
   
    sum1=0;
    for j = 1:n
       sum1=sum1 + j*x(j);
    end

    if((opt==1)||(opt==3))
        fvec(i)= i*sum1 - 1;
    end

    if((opt==2)||(opt==3))
       
        for j= 1:n
           J(i,j)=i*j;
        end

    end
end
fvec=fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   gx = 2*fvec'*J ;
   out=gx';
end





