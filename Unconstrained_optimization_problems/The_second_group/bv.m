% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

% Discrete boundary value function
% -------------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable, m=n
% Standard starting point -> x=(s(j)) where
%                            s(j)=t(j)*(t(j)-1) where
%                            t(j)=j*h & h=1/(n+1)
% Minima -> f=0 
%                                     
% 12/4/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = bv(n,x,mode)  

m=n;
fvec=zeros(1,m);

h=1/(n+1);

t=[1:n]*h;

for i=1:n
     x(n+1)=0;
     if (i==1)
        fvec(i)=2*x(i)-x(i+1)+(h^2*(x(i)+t(i)+1)^3)/2;    
     elseif (i==n)
        fvec(i)=2*x(i)-x(i-1)+(h^2*(x(i)+t(i)+1)^3)/2;
     else
        fvec(i)=2*x(i)-x(i-1)-x(i+1)+(h^2*(x(i)+t(i)+1)^3)/2;
     end;
end;
 
fvec=fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   J=zeros(m,n);
   for i=1:n
        J(i,i)=2+h^2/2*3*(x(i)+t(i)+1)^2;
        if (i<n)
           J(i,i+1)=-1;
           J(i+1,i)=-1;
        end;
    end;
    gx = 2*fvec'*J ;
    out=gx';
end

   

%

