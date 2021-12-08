% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

%Function [fvec,J]= lin(n,m,x,opt)
%Linear function - full rank [32]
%Dimensions: n variable,      m>=n
%Standard starting point: (1,...,1)
%Minima of f=m-n at (-1,...,-1)
%
%Coded in MATLAB   11/94        plk



function out = lin(n,x,mode)
m=500;
fvec=zeros(1,m);
J=zeros(m,n);
opt=3;
for i=1:n

    sum1=sum(x);
        
    if((opt==1)||(opt==3))
        fvec(i)= x(i)-(2/m)*sum1-1;
    end;

    if((opt==2)||(opt==3))
        for j=1:n
           if i==j
                J(i,j)=1-(2/m);
           else J(i,j)=-(2/m);
           end;
        end;
    end;
end;

for i=n+1:m
        
    if((opt==1)||(opt==3))
        fvec(i)= -(2/m)*sum1-1;
    end;

    if((opt==2)||(opt==3))
        for j=1:n
                J(i,j)=-(2/m);
        end;
    end;
end;
       
fvec=fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
    gx = 2*fvec'*J ;
    out=gx';
end

