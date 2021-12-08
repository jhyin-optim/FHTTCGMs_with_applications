% Matlab Model by Jianghua Yin (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out = arglinb(n,x,mode) 
N=n;
m=3;
% N = 100;

% initial point x=zeros(N,1);

if mode==1
    fx=0;
    fx1=0;
  for i=1:m
    for j=1:N
        fx1=fx1+i*j*x(j);
    end
    fx=fx+(fx1-1)^2;
    fx1=0;
  end
  out = fx;
elseif mode==2
  gx = zeros(N,1);
  s=0;
  for k=1:N
    for i=1:m;
        for j=i:N
            s=s+i*j*x(j);
        end
        gx(k)=gx(k)+2*(s-1)*i*k;
        s=0;
    end
  end
  out = gx;
end
% minimize f:	sum {i in 1..N-1} 100*(x[i+1]-x[i]+1-x[i]^2)^2;
