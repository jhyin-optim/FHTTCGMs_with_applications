% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation. 

% Extended Rosenbrock function 
% ---------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable but even, m=n 
% Problem no. 21            
% Standard starting point -> x=(s(j)) where 
%                            s(2*j-1)=-1.2, 
%                            s(2*j)=1 
% Minima -> f=0 at (1,.....,1)              
%                                     
% 11/21/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = rosex(n,x,mode) 

m=n;

option=3;
J=zeros(m,n);
fvec=zeros(1,m);

for i=1:m/2

   if (option==1 || option==3)
        fvec(2*i-1)=10*(x(2*i)-x(2*i-1)^2);
        fvec(2*i)=1-x(2*i-1);
   end;        

   if (option==2 || option==3)
        J(2*i-1,2*i-1) = -20*x(2*i-1);
        J(2*i-1,2*i)   = 10; 
        J(2*i,2*i-1)   = -1;
   end;

end;

if (option==1 || option==3)
	fvec=fvec';
end;

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   gx = 2*fvec'*J ;
   out=gx';
end


 
%
