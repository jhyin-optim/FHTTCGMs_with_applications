% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation. 

% Discrete integral equation function
% ----------------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensions -> n=variable, m=n
% Standard starting point -> x=(s(j)) where
%                            s(j)=t(j)*(t(j)-1) where
%                            t(j)=j*h & h=1/(n+1)
% Minima -> f=0 
%                                     
% 12/4/94 by Madhu Lamba  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = ie(n,x,mode)  
m=n;
fvec=zeros(1,m);
s=zeros(1,n);
h=1/(n+1);
for i=1:n
   s(i)=i*h;
end;

for i=1:n
        x(n+1)=0;
        sum1=0;
        for j=1:i
            sum1=sum1+s(j)*(x(j)+s(j)+1)^3;
        end;
        sum2=0;
        if (n>i) 
          for j=i+1:n
              sum2=sum2+(1-s(j))*(x(j)+s(j)+1)^3;
          end;
        end;
        fvec(i)=x(i)+h*((1-s(i))*sum1+s(i)*sum2)/2;
end;   

fvec=fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   J=zeros(m,n);

   for i=1:n
      for j=1:n
         if (j<i)
            J(i,j)=3*h/2*(1-s(i))*s(j)*(x(j)+s(j)+1)^2;
         elseif (j>i)
            J(i,j)=3*h/2*s(i)*(1-s(j))*(x(j)+s(j)+1)^2; 
         elseif (j==i)
            J(i,i)=1+3*h/2*(1-s(i))*s(i)*(x(i)+s(i)+1)^2;
         end;
      end;
   end;   
   gx = 2*fvec'*J ;
   out=gx';
end


   
   


%

