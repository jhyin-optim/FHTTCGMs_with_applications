% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.   

% Penalty II  function
% ------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable, m=2*n
% Problem no. 24             
% Standard starting point -> x=(1/2,......,1/2)
% Minima -> f=9.37629...10^(-6)  if n=4
%           f=2.93660...10^(-4)  if n=10            
%                                     
% 11/21/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = pen2(n,x,mode)  
m=2*n;
option=3;
fvec=zeros(1,m);
J=zeros(m,n);
if (option==1 || option==3)
   fvec(1)=x(1)-0.2;
end

if (option==2 || option==3)
   J(1,1)=1;
end
y=zeros(1,n-1);
if(n>=2)

   for i=2:n
     y(i)=exp(i/10)+exp((i-1)/10);

     if (option==1 || option==3)
        fvec(i)=sqrt(1.e-5)*(exp(x(i)/10)+exp(x(i-1)/10)-y(i));
     end       

     if (option==2 || option==3)
	J(i,i)   = sqrt(1.e-5)*exp(x(i)/10)*(1/10);
        J(i,i-1) = sqrt(1.e-5)*exp(x(i-1)/10)*(1/10);
     end;
   end
  
   for i=n+1:(2*n-1)
       
     if (option==1 || option==3)
        fvec(i)=sqrt(1.e-5)*(exp(x(i-n+1)/10)-exp(-1/10));
     end
 
     if (option==2 || option==3)
	J(i,i-n+1) = sqrt(1.e-5)*exp(x(i-n+1)/10)*(1/10);
     end 
   end
end

if (option==1 || option==3) 

    sum=0;
    for j=1:n
        sum=sum+(n-j+1)*x(j)^2;
    end;
    fvec(2*n)=sum-1; 
end;
if (option==2 || option==3)
    for j=1:n
        J(m,j) = (n-j+1)*2*x(j);
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

