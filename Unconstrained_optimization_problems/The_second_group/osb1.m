% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

% *******************************************************
%  Osborne 1 function   [17]
% Dimensions: n=5 , m=33
% Function Definition:
%       f(x)=y(i)-(x1+x2*exp[-t(i)x4]+x3*exp[-t(i)x5])
%       where t(i)=10(i-1)
% Standard starting point: (0.5,1.5,-1,0.01,0.02)
% Minima of f=5.46489...10^(-5)
%           at (.3754,1.9358,-1.4647,0.01287,0.02212)
%
% Revised  11/94                PLK
% *******************************************************


function out  =  osb1(n,x,mode)

      global FIRSTIME y;

      m=33;

      x1 = x(1);
      x2 = x(2);
      x3 = x(3);
      x4 = x(4);
      x5 = x(5);
      fvec=zeros(1,m);
      J=zeros(m,5);
      option=3;

if (FIRSTIME)
      y( 1) = 0.844d0;
      y( 2) = 0.908d0;
      y( 3) = 0.932d0;
      y( 4) = 0.936d0;
      y( 5) = 0.925d0;	
      y( 6) = 0.908d0;
      y( 7) = 0.881d0;
      y( 8) = 0.850d0;
      y( 9) = 0.818d0;
      y(10) = 0.784d0;
      y(11) = 0.751d0;
      y(12) = 0.718d0;
      y(13) = 0.685d0;
      y(14) = 0.658d0;
      y(15) = 0.628d0;
      y(16) = 0.603d0;
      y(17) = 0.580d0;
      y(18) = 0.558d0;
      y(19) = 0.538d0;
      y(20) = 0.522d0;
      y(21) = 0.506d0;
      y(22) = 0.490d0;
      y(23) = 0.478d0;
      y(24) = 0.467d0;
      y(25) = 0.457d0;
      y(26) = 0.448d0;
      y(27) = 0.438d0;
      y(28) = 0.431d0;
      y(29) = 0.424d0;
      y(30) = 0.420d0;
      y(31) = 0.414d0;
      y(32) = 0.411d0;
      y(33) = 0.406d0;
      y = y';
      FIRSTIME=0;
end;

      im1 = 0.0d0;
      for i = 1: m
        ti   =  im1*10.d0;
        e4 = exp(-ti*x4);
        e5 = exp(-ti*x5);
        t2 = x2*e4;
        t3 = x3*e5;
	if (option==1 || option==3)
	        fvec(i) = (x1 + t2 + t3) - y(i);
	end
	if (option ==2 || option ==3)
        	J( i, 1) = 1.d0;
        	J( i, 2) =  e4;
        	J( i, 3) =  e5;
        	J( i, 4) = -ti*t2;
        	J( i, 5) = -ti*t3;
	end
        im1 = i;
      end
      fvec = fvec';

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
   gx = 2*fvec'*J ;
    out=gx';
end



% x0 = [.5,1.5,-1,.01,.02]';
%
        
