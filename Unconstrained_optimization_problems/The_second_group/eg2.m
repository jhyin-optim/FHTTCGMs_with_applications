% Matlab Model by Qian Chen (Nov.,2015,Yulin)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  
% ������Դ������...
% Ŀ�꺯����f=...
% ��ʼ�� x0=(1,1,...,1) һ��Ҫд

function out = eg2(n,x,mode)   %%%%%%  ��������
N=n;
if mode==1                     %%%%%%  Ŀ�꺯��
  fx=0;
  a=0;
  for i=1:N-1
      a=a+sin(x(1)+x(i)^2-1);
  end
  fx=a+1/2*sin(x(N)^2);
  out=fx;
elseif  mode==2                %%%%%%   Ŀ�꺯���ݶ�
    gx = ones(N,1);
    b=0;
    for i=2:N-1
      b=b+cos(x(1)+x(i)^2-1);
    end
    gx(1)=(1+2*x(1))*cos(x(1)+x(1)^2-1)+b;
    for i=2:N-1
        gx(i)=2*x(i)*cos(x(1)+x(i)^2-1);
    end
    gx(N)=x(N)*cos(x(N)^2);
    out=gx;
end