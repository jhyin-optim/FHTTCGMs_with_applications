% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
%  cuter dixmaana
%  Source:
%   L.C.W. Dixon and Z. Maany,
%   "A family of test problems with sparse Hessians for unconstrained
%   optimization",
%   TR 206, Numerical Optimization Centre, Hatfield Polytechnic, 1988.

%   See also Buckley#221 (p. 49)
%   SIF input: Ph. Toint, Dec 1989.
%              correction by Ph. Shott, January 1995.

%   classification OUR2-AN-V-0


% prob='dixmaanc';

function out = dixmaanc(n,x,mode)

M =n/3;
N =3*M;


% ≥ı ºµ„ x=2.0*ones(N,1);

alpha =1.0;
beta=0.125;
gamma=0.125;
delta = 0.125;
K = zeros(4,1);

if mode==1
   fx=1.0 + sum ([alpha*(x.^2)'*([1:N]'/N).^K(1)]) + ...
     sum([beta*(x(1:N-1).^2)'.*((x(2:N)+x(2:N).^2).^2)'*([1:N-1]'/N).^K(2)])+...
     sum([gamma*(x(1:2*M).^2)'.*(x(1+M:3*M).^4)'*([1:2*M]'/N).^K(3)])+...
     sum([delta*x(1:M)'.*x(1+2*M:3*M)'*([1:M]'/N).^K(4)]);
   out = fx;
elseif mode==2
   gx = ones(N,1);
   gx(1) = 2*alpha*x(1)*(1/N)^K(1)+2*beta*x(1)*(x(2)+x(2)^2)^2*(1/N)^K(2)+2*gamma*x(1)*x(1+M)^4*(1/N)^K(3)+ delta*x(1+2*M)*(1/N)^K(4);
   for i=2:M
     gx(i)=2*alpha*x(i)*(i/N)^K(1)+ 2*beta*(x(i)*(x(i+1)+x(i+1)^2)^2*(i/N)^K(2)+x(i-1)^2*(x(i)+x(i)^2)*(1+2*x(i))*((i-1)/N)^K(2))+...
      2*gamma*x(i)*x(i+M)^4*(i/N)^K(3)+ delta*x(i+2*M)*(i/N)^K(4);
   end
   for i=M+1:2*M
     gx(i)=2*alpha*x(i)*(i/N)^K(1)+ 2*beta*(x(i)*(x(i+1)+x(i+1)^2)^2*(i/N)^K(2)+x(i-1)^2*(x(i)+x(i)^2)*(1+2*x(i))*((i-1)/N)^K(2))...
            +2*gamma*(x(i)*x(i+M)^4*(i/N)^K(3)+4*x(i-M)^2*x(i)^3*((i-M)/N)^K(3));
   end
   for i=2*M+1:3*M-1
     gx(i)=2*alpha*x(i)*(i/N)^K(1)+2*beta*(x(i)*(x(i+1)+x(i+1)^2)^2*(i/N)^K(2)+x(i-1)^2*(x(i)+x(i)^2)*(1+2*x(i))*((i-1)/N)^K(2))+...
           4*gamma*x(i-M)^2*x(i)^3*((i-M)/N)^K(3)+delta*x(i-2*M)*((i-2*M)/N)^K(4);
   end
   gx(3*M)=2*alpha*x(N)+ 2*beta*x(N-1)^2*(x(N)+x(N)^2)*(1+2*x(N))*((N-1)/N)^K(2)+4*gamma*x(N-M)^2*x(N)^3*((N-M)/N)^K(3)+...
          delta*x(N-2*M)*((N-2*M)/N)^K(4);
   out = gx;
end



