% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

% **************************************************************
% **************************************************************
%  Osborne 2 function      [19]
%  Dimensions:  n=11, m=65
%  Standard starting point: (1.3,0.65,0.7,0.6,3,5,7,2,4.5,5.5)
%  Minima of f=4.01377...10^(-2)
%  at (1.31,.4315,.6336,.5993,.7539,.9056,1.3651,4.8248,2.3988,
%       4.5689,5.6754)
%
%  Revised   11/94              Plk
% **************************************************************

function out = osb2(n,x,mode)

m=65;

global FIRSTIME y;
J=zeros(m,n);
fvec=zeros(1,m);
t=zeros(1,m);
if (FIRSTIME)
    y  = [1.366  1.191  1.112  1.013  .991
        .885  .831  .847  .786 .725
        .746   .679   .608  .655  .616
        .606  .602  .626    .651  .724
        .649   .649  .694  .644  .624
        .661  .612   .558  .533  .495
        .500  .423  .395  .375  .372
        .391  .396   .405   .428   .429
        .523  .562  .607  .653  .672
        .708   .633   .668   .645  .632
        .591  .559  .597  .625  .739
        .710   .729   .720  .636  .581
        .428  .292  .162  .098   .054 ]';
    FIRSTIME=0;
end;

for i = 1:m
    t(i) = (i-1)/10;
    t09= t(i)-x(9);
    t10= t(i)-x(10);
    t11= t(i)-x(11);
    s09= t09^2;
    s10= t10^2;
    s11= t11^2;
    e1= exp(-t(i)*x(5));
    e2= exp(-s09*x(6));
    e3= exp(-s10*x(7));
    e4=exp(-s11*x(8));
    opt=3;
    if((opt==1) || (opt==3))
        fvec(i) = (x(1)*e1 + x(2)*e2 + x(3)*e3 + x(4)*e4)-y(i);
    end;
    
    if((opt==2) || (opt==3))
        r2=x(2)*e2;
        r3=x(3)*e3;
        r4=x(4)*e4;
        
        J(i,1)=e1;
        J(i,2)=e2;
        J(i,3)=e3;
        J(i,4)=e4;
        J(i,5)=-t(i)*x(1)*e1;
        J(i,6)= -s09*r2;
        J(i,7)= -s10*r3;
        J(i,8)= -s11*r4;
        J(i,9)= 2*t09*x(6)*r2;
        J(i,10)=2*t10*x(7)*r3;
        J(i,11)=2*t11*x(8)*r4;
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


%x0 = [1.3,.65,.65,.7,.6,3,5,7,2,4.5,5.5]' ;
%


