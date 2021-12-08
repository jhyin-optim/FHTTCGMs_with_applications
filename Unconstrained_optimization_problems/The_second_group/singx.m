% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

% Extended Powell Singular function
% --------------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable but a multiple of 4, m=n             
% Problem no. 22
% Standard starting point -> x=(s(j)) where 
%                            s(4*j-3)=3, 
%                            s(4*j-2)=-1,
%                            s(4*j-1)=0,
%                            s(4*j)=1 
% Minima -> f=0 at the origin.            
%                                     
% 11/21/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = singx(n,x,mode)  

m=n;

fvec=zeros(1,m);
J=zeros(m,n);
for i=1:m/4
        fvec(4*i-3)=x(4*i-3)+10*(x(4*i-2));
        fvec(4*i-2)=sqrt(5)*(x(4*i-1)-x(4*i));
        fvec(4*i-1)=(x(4*i-2)-2*(x(4*i-1)))^2;
        fvec(4*i)  =sqrt(10)*(x(4*i-3)-x(4*i))^2;       
end;
fvec=fvec';
if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   J=zeros(m,n);
   for i=1:m/4
	J(4*i-3,4*i-3) = 1;
       J(4*i-3,4*i-2) = 10;
       J(4*i-2,4*i-1) = sqrt(5);
       J(4*i-2,4*i)   = -sqrt(5);
       J(4*i-1,4*i-2) = 2*x(4*i-2)-4*x(4*i-1);
       J(4*i-1,4*i-1) = 8*x(4*i-1)-4*x(4*i-2);
       J(4*i,4*i-3)   = 2*sqrt(10)*(x(4*i-3)-x(4*i));
       J(4*i,4*i)     = 2*sqrt(10)*(x(4*i)-x(4*i-3));
    end;
    gx = 2*fvec'*J ;
    out=gx';
end



%
