% init 
% ----- 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [nprob,n,m,x0]=initf(nprob)
% This function sets n,m, and the standard starting    
% point based on the nprob and returns it to initpt     
% function.                                             
%                                                       
% Created on 10/30/94 by Madhu Lamba                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [nprob,n,x0] = init(NO)

global FIRSTIME

switch NO

%% nprob='cosine'; cuter
    case 1
        nprob='cosine';
        n =6000;
        x0 = 1.0*ones(n,1);

 %% nprob='cosine'; cuter
     case 2
         nprob='cosine';
         n =100000;
         x0 = 1.0*ones(n,1);
         
 %% nprob='cosine'; cuter
     case 3
         nprob='cosine';
         n =800000;
         x0 = 1.0*ones(n,1); 
               
%% dixmaana.m cuter  P
    case 4
        nprob='dixmaana';         
        M =2000;
        n =3*M;
        x0=2.0*ones(n,1);
        
  %% dixmaana.m cuter  P
    case 5
        nprob='dixmaana';         
        M =30000;
        n =3*M;
        x0=2.0*ones(n,1);     
        
%% dixmaanb.m  cuter  P
    case 6
        nprob='dixmaanb';
        M = 8000;
        n =3*M;
        x0=2.0*ones(n,1);
        
 %% dixmaanb.m  cuter  P
    case 7
        nprob='dixmaanb';
        M = 16000;
        n =3*M;
        x0=2.0*ones(n,1);    
        
%% dixmaanc.m  cuter   P
    case 8
        nprob='dixmaanc';
        M =900;
        n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaanc.m  cuter   P
    case 9
        nprob='dixmaanc';
        M =9000;
        n =3*M;
        x0=2.0*ones(n,1);      
        
%% dixmaand.m  cuter  P
    case 10
        nprob='dixmaand';
        M =4000;
        n =3*M;
        x0=2.0*ones(n,1);
        
 %% dixmaand.m  cuter  P
    case 11
        nprob='dixmaand';
        M =30000;
        n =3*M;
        x0=2.0*ones(n,1);     
        
%% dixmaane.m   cuter   P
      case 12
          nprob='dixmaane';
          M = 800;
          n =3*M;
          x0=2.0*ones(n,1);  
        
%% dixmaane.m   cuter   P
      case 13
          nprob='dixmaane';
          M = 16000;
          n =3*M;
          x0=2.0*ones(n,1);  

%% dixmaanf.m   cuter  P
   case 14
        nprob='dixmaanf';
        M =5000;
        n =3*M;
        x0=2.0*ones(n,1);

%% dixmaanf.m   cuter  P
   case 15
        nprob='dixmaanf';
        M =20000;
        n =3*M;
        x0=2.0*ones(n,1);

%% dixmaang.m   cuter  P
    case 16
        nprob='dixmaang';
        M =4000;
        n =3*M;
        x0=2.0*ones(n,1);

%% dixmaang.m   cuter  P
    case 17
        nprob='dixmaang';
        M =30000;
        n =3*M;
        x0=2.0*ones(n,1);

%% dixmaanh.m   cuter   P
    case 18
        nprob='dixmaanh';
        M =2000;
        n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaanh.m   cuter   P
    case 19
        nprob='dixmaanh';
        M =50000;
        n =3*M;
        x0=2.0*ones(n,1);
 
%% dixmaani.m  
   case 20
        nprob='dixmaani';
        M =120;
        n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaanj.m   cuter   P
    case 21
        nprob='dixmaanj';
        M=1000;
        n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaanj.m   cuter   P
    case 22
        nprob='dixmaanj';
        M=5000;
        n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaank.m  cuter   P
    case 23
        nprob='dixmaank';
        M =4000;
       n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaank.m  cuter   P
    case 24
        nprob='dixmaank';
        M =40000;
       n =3*M;
        x0=2.0*ones(n,1);
        
%% dixmaanl.m   cuter   P
     case 25
         nprob='dixmaanl';
         M =800;
         n =3*M;
         x0=2.0*ones(n,1);
            
%% dixmaanl.m   cuter   P
     case 26
         nprob='dixmaanl';
         M =8000;
         n =3*M;
         x0=2.0*ones(n,1);
        
%% dixon3dq.m  cuter  P
    case 27
        nprob='dixon3dq';
        n =150;
        x0=-1.0*ones(n,1);

%% dqdrtic.m   cuter  P
    case 28
         nprob='dqdrtic';
         n = 9000;
         x0=3.0*ones(n,1);
         
%% dqdrtic.m   cuter  P
    case 29
         nprob='dqdrtic';
         n = 90000;
         x0=3.0*ones(n,1);
         
%% dqrtic.m   cuter
    case 30
        nprob='dqrtic';
        n = 5000;
        x0=2.0*ones(n,1);  
         
%% dqrtic.m   cuter
    case 31
        nprob='dqrtic';
        n = 150000;
        x0=2.0*ones(n,1);  
 
%% edensch.m   cuter  P
    case 32
        nprob='edensch';
        n =7000;
        x0=zeros(n,1);
        
%% edensch.m   cuter  P
    case 33
        nprob='edensch';
        n = 40000;
        x0=zeros(n,1);
        
%% edensch.m   cuter  P
    case 34
        nprob='edensch';
        n = 500000;
        x0=zeros(n,1);

%% nprob='eg2': cuter
    case 35
        nprob='eg2';
        n=100;
        x0 = ones(n,1);
    
%% fletchcr.m    cuter P
    case 36
         nprob='fletchcr';
         n =1000;
         x0=zeros(n,1);  
         
%% fletchcr.m    cuter P
    case 37
         nprob='fletchcr';
         n =50000;
         x0=zeros(n,1);  
         
%% fletchcr.m    cuter P
    case 38
         nprob='fletchcr';
         n =200000;
         x0=zeros(n,1);  
         
%% freuroth.m   cuter  P
     case 39
         nprob='freuroth';
         n =460;
         x0 = [0.5; -2.0; zeros(n-2,1)];     
         
%% genrose.m   cuter  N
     case 40
         nprob='genrose';
         n = 10000;
         x0 =  1/(n+1)*ones(n,1);
        
%% nprob='himmelbg'; cuter    
    case 41
        nprob='himmelbg';
        n=70000;
        x0=1.5*ones(n,1);
        
%% nprob='himmelbg'; cuter    
    case 42
        nprob='himmelbg';
        n=240000;
        x0=1.5*ones(n,1);
        
%% liarwhd.m   cuter  N
     case 43
         nprob='liarwhd';
         n = 6000;
         x0 = 4.0*ones(n,1);
         
%% liarwhd.m   cuter  N
    case 44
        nprob='liarwhd';
        n = 30000;
        x0 = 4.0*ones(n,1); 

 %% penalty1.m 与60重复   cuter
     case 45
         nprob='penalty1';
         n = 4000;
         x0 = -1.0*ones(n,1);            

 %% penalty1.m 与60重复   cuter
     case 46
         nprob='penalty1';
         n = 10000;
         x0 = -1.0*ones(n,1);  

%% quartc.m   cuter
    case 47
        nprob='quartc';
        n =4000;
        x0 = 2.0*ones(n,1);  
        
 %% quartc.m   cuter
    case 48
        nprob='quartc';
        n =80000;
        x0 = 2.0*ones(n,1);  

%% quartc.m   cuter
    case 49
        nprob='quartc';
        n =500000;
        x0 = 2.0*ones(n,1);  
        
%% tridia.m   cuter
     case 50
         nprob='tridia';
         n=300;
         x0=ones(n,1);
         
%% tridia.m   cuter
     case 51
         nprob='tridia';
         n=2000;
         x0=ones(n,1);   
         
%% woods.m   
     case 52
         nprob='woods';
         n=150000;
         x0=zeros(n,1);
 
%% woods.m   
     case 53
         nprob='woods';
         n=200000;
         x0=zeros(n,1);
         
%% nprob='bdexp'; cuter 
    case 54
        nprob='bdexp';
        n=5000;
        x0 = ones(n,1); 
        
%% nprob='bdexp'; cuter 
    case 55
        nprob='bdexp';
        n=50000;
        x0 = ones(n,1);  
        
%% nprob='bdexp'; cuter 
    case 56
        nprob='bdexp';
        n=500000;
        x0 = ones(n,1);  
        
%% nprob='exdenschnf';        
    case 57
        nprob='exdenschnf'; 
        n=90000;
        m=n/2;
        a=ones(n,1);
        for i=1:m
            a(2*i-1)=2;
            a(2*i)=0;
        end
        x0=a;    
        
%% nprob='exdenschnf';        
    case 58
        nprob='exdenschnf'; 
        n=280000;
        m=n/2;
        a=ones(n,1);
        for i=1:m
            a(2*i-1)=2;
            a(2*i)=0;
        end
        x0=a;    
        
%% nprob='exdenschnf';        
    case 59
        nprob='exdenschnf'; 
        n=600000;
        m=n/2;
        a=ones(n,1);
        for i=1:m
            a(2*i-1)=2;
            a(2*i)=0;
        end
        x0=a;    

%% nprob='exdenschnb';      
    case 60
        nprob='exdenschnb';
        n=6000;
        x0=ones(n,1);   
        
%% nprob='exdenschnb';      
    case 61
        nprob='exdenschnb';
        n=24000;
        x0=ones(n,1);  

%% nprob='exdenschnb';      
    case 62
        nprob='exdenschnb';
        n=300000;
        x0=ones(n,1);   
        
%% nprob='genquartic';   
    case 63
        nprob='genquartic';  
        n=9000;
        x0=ones(n,1);
        
%% nprob='genquartic';   
    case 64
        nprob='genquartic';  
        n=90000;
        x0=ones(n,1);
        
%% nprob='genquartic';   
    case 65
        nprob='genquartic';  
        n=500000;
        x0=ones(n,1);  
        
%% nprob='biggsb1'; cuter   
    case 66
        nprob='biggsb1';
        n= 300;
        x0 = zeros(n,1);    

%% nprob='sine'; cuter      
    case 67
        nprob='sine';
        n=100000;
        x0 = ones(n,1);   
        
%% nprob='sine'; cuter      
    case 68
        nprob='sine';
        n=250000;
        x0 = ones(n,1);  
        
%% nprob='sine'; cuter      
    case 69
        nprob='sine';
        n=500000;
        x0 = ones(n,1);  
        
%% nprob='fletcbv3'; cuter
    case 70
       nprob='fletcbv3' ;
       n= 100;
       a = ones(n,1);
       for i=1:n
            a(i)=i/(1+n);
        end
        x0=a;       
        
 %% nprob='nonscomp'; cuter  
    case 71
        nprob='nonscomp';
        n=5000;
        x0=3*ones(n,1);
        
%% nprob='nonscomp'; cuter  
    case 72
        nprob='nonscomp';
        n=80000;
        x0=3*ones(n,1);
        
%% power1.m   N  cuter
    case 73
        nprob='power1';        
        n =150;
        x0 = 1.0*ones(n,1);   
        
%% nprob='raydan1'; 
    case 74
        nprob='raydan1';
        n=500;
        x0 = ones(n,1); 
        
 %% nprob='raydan1'; 
    case 75
        nprob='raydan1';
        n=5000;
        x0 = ones(n,1); 
        
%% nprob='raydan2'; 
    case 76
        nprob='raydan2';
        n=2000;
        x0 = ones(n,1); 
        
%% nprob='raydan2'; 
    case 77
        nprob='raydan2';
        n=20000;
        x0 = ones(n,1);
        
%% nprob='raydan2'; 
    case 78
        nprob='raydan2';
        n=500000;
        x0 = ones(n,1); 
        
%% nprob='diagonal1';
    case 79
        nprob='diagonal1';
        n=800;
        x0=1/n*ones(n,1);   
   
%% nprob='diagonal1';
    case 80
        nprob='diagonal1';
        n=2000;
        x0=1/n*ones(n,1); 
        
%% nprob='diagonal2';
    case 81
        nprob='diagonal2';
        n=8000;
        for i=1:n
        x0=1/i*ones(n,1);
        end     
        
%% nprob='diagonal2';
    case 82
        nprob='diagonal2';
        n=50000;
        for i=1:n
        x0=1/i*ones(n,1);
        end     

%% nprob='diagonal3';
    case 83
        nprob='diagonal3';
        n=500;
        x0 = ones(n,1); 
        
%% nprob='diagonal3';
    case 84
        nprob='diagonal3';
        n=2000;
        x0 = ones(n,1); 
 
%% bv.m   P
     case 85
       nprob='bv';
       n=2000; %1000
       h=1/(n+1);
       t=zeros(1,n);
       x0=zeros(1,n);
       for j=1:n
           t(j)=j*h;
           x0(j)=t(j)*(t(j)-1);
       end
       x0=x0'; 
       
  %% bv.m   P
     case 86
       nprob='bv';
       n=20000; %1000
       h=1/(n+1);
       t=zeros(1,n);
       x0=zeros(1,n);
       for j=1:n
           t(j)=j*h;
           x0(j)=t(j)*(t(j)-1);
       end
       x0=x0';
       
%% ie.m  P
       case 87
        nprob='ie';
        n=500;
        h=1/(n+1);
        s=zeros(1,n);
        a=zeros(1,n);
        for j=1:n
            s(j)=j*h;
            a(j)=s(j)*(s(j)-1);
        end
       x0=a';
       
 %% ie.m  P
       case 88
        nprob='ie';
        n=1500;
        h=1/(n+1);
        s=zeros(1,n);
        a=zeros(1,n);
        for j=1:n
            s(j)=j*h;
            a(j)=s(j)*(s(j)-1);
        end
       x0=a';
       
%% singx   P 
     case 89
          nprob='singx';
          n=1000;
         x0=zeros(n,1);
          for j=1:n/4
             x0(4*j-3)=3;
              x0(4*j-2)=-1;
              x0(4*j-1)=0;
              x0(4*j)=1;
          end
          
%% singx   P 
     case 90
          nprob='singx';
          n=2000;
         x0=zeros(n,1);
          for j=1:n/4
             x0(4*j-3)=3;
              x0(4*j-2)=-1;
              x0(4*j-1)=0;
              x0(4*j)=1;
          end
          
%% lin.m  P
    case 91
       nprob='lin';
       n=100;
       x0=ones(n,1);
       
%% lin.m  P
    case 92
       nprob='lin';
       n=1300;
       x0=ones(n,1);
       
%% osb2.m  P
     case 93
        nprob='osb2';
        n=11;
 	 FIRSTIME=1;
         x0=[1.3,0.65,0.65,0.7,0.6,3,5,7,2,4.5,5.5]';
          
%% pen1.m
     case 94
         nprob='pen1';
         n =200;
         x0=zeros(n,1);
         for j=1:n
             x0(j)=j;
         end      
          
%% pen1.m
     case 95
         nprob='pen1';
         n =1000;
         x0=zeros(n,1);
         for j=1:n
             x0(j)=j;
         end      
         
%% pen2 
   case 96
       nprob='pen2';
       n=160;
       x0=(1/2)*(ones(n,1));  
         
%% rosex P
    case 97
        nprob='rosex';
        n=500;
        x0=zeros(n,1); 
        for j=1:n/2
            x0(2*j-1)=-1.2;
            x0(2*j)=1;
        end
        
%% rosex P
    case 98
        nprob='rosex';
        n=1000;
        x0=zeros(n,1); 
        for j=1:n/2
            x0(2*j-1)=-1.2;
            x0(2*j)=1;
        end
        
%% trid.m     N
    case 99
        nprob='trid';
        n=500;
        x0=(-1)*(ones(n,1));
        
 %% trid.m     N
    case 100
        nprob='trid';
        n=8000;
        x0=(-1)*(ones(n,1));    
end
