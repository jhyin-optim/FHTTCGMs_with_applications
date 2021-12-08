% Matlab Model by Lin Han (Jan.,2014,Ningbo)
% Copyright (C) 2014 Jian Group
% All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.  

% Powell badley scaled function 
% ----------------------------- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [fvec,J]=badscp(n,m,x,option)   
% Problem no. 3
% Dimensions -> n=2, m=2                      
% Standard starting point -> x=(0,1)          
% Minima -> f=0 at (1.098...10-E5,9.106...)   
%                                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function out = badscp(n,x,mode)

fvec = [  10^4*x(1)*x(2)-1
        exp(-x(1))+exp(-x(2))-1.0001  ] ;

if mode==1
   fx=fvec' * fvec;
   out=fx;
elseif mode==2
    J    = [  10^4*x(2)        10^4*x(1)
             -exp(-x(1))      -exp(-x(2))  ] ;
    gx = 2*fvec'*J ;
    out=gx';
end

%
