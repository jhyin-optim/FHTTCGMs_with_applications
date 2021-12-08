% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

% Broyden tridiagonal function
% ---------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable, m=n
% Problem no. 30
% Standard starting point -> x=(-1,..,-1)
% Minima -> f=0 
%                                     
% 11/21/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = trid(n,x,mode)  

m=n;


for i=1:n
      x(n+1)=0;
      if (i==1)
         fvec(i)=(3-2*x(i))*x(i)-2*x(i+1)+1;
      elseif (i==n)
         fvec(i)=(3-2*x(i))*x(i)-x(i-1)+1;
      else
         fvec(i)=(3-2*x(i))*x(i)-x(i-1)-2*x(i+1)+1;
      end;          
end; 

fvec=fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   J=zeros(m,n);
   for i=1:n
      J(i,i)=3-4*x(i);
      if (i<n)
         J(i,i+1)=-2;
         J(i+1,i)=-1;
      end;
   end;
   gx = 2*fvec'*J ;
   out=gx';
end

   
   


%

