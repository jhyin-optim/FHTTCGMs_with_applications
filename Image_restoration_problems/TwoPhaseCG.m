function [Tcpu,Itr,tpc_img] = TwoPhaseCG(img,Nmax,para,method,xs)
    tic;                                                          %% start clock
    [m,n]=size(img);mm = m+2*Nmax+1;  
    imgn=zeros(m+2*Nmax+1,n+2*Nmax+1); 
    imgn(Nmax+1:m+Nmax,Nmax+1:n+Nmax)=img;
    imgn(1:Nmax,Nmax+1:n+Nmax)=img(1:Nmax,1:n);                    %��չ�ϱ߽�
    imgn(1:m+Nmax,n+Nmax+1:n+2*Nmax+1)=imgn(1:m+Nmax,n:n+Nmax);    %��չ�ұ߽�
    imgn(m+Nmax+1:m+2*Nmax+1,Nmax+1:n+2*Nmax+1)=imgn(m:m+Nmax,Nmax+1:n+2*Nmax+1);    %��չ�±߽�
    imgn(1:m+2*Nmax+1,1:Nmax)=imgn(1:m+2*Nmax+1,Nmax+1:2*Nmax);                      %��չ��߽�
    re=imgn;
    N = zeros(m*n,1);u = zeros(m*n,1);
    V = zeros(m*n,4);tmp_index = 0;
    for i=Nmax+1:m+Nmax
        for j=Nmax+1:n+Nmax
            r=1;                                %����뾶
            while r~=Nmax
                W=imgn(i-r:i+r,j-r:j+r);
                Imin=min(W(:));
                Imax=max(W(:));
                Imed=median(W(:));
                if Imin<Imed && Imed<Imax       %�����ǰ������ֵ���������㣬��ô���ô˴ε�����
                   break;
                else
                   r=r+2;                       %�������󴰿ڣ������ж� %r=r+1;
                end          
            end
            
            if Imin<imgn(i,j) && imgn(i,j)<Imax %�����ǰ������ز���������ԭֵ���
                re(i,j)=imgn(i,j);
            else                                %�����¼��ǰ�������λ�ü���4�����ڽ�λ��,���õ�matlab������ʽ
                tmp_index = tmp_index + 1;      %%%%%%%%%%%%%%%%%%%%%%%%4��1��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                u(tmp_index) = imgn(i,j);       %1;  Imed;%                                     %$$$$$$$$$  %Imed; 
                N(tmp_index) = (j-1)*mm+i;                                              
                V(tmp_index,:) = [(j-2)*mm+i,(j-1)*mm+(i+1),j*mm + i,(j-1)*mm+(i-1)];   %�� �� �� ��
            end
        end
    end
    N = N(1:tmp_index);
    u = u(1:tmp_index);
    V = V(1:tmp_index,:);
    [Itr,re(N)] = CGMWWP(u,N,V,imgn,para,method,xs);   %re(N) = rescale(re(N))*255; %rescale  �������е�Ԫ�����ŵ����䡾0��1��
    nimg = re(Nmax+1:m+Nmax,Nmax+1:n+Nmax);
    tpc_img = uint8(nimg);                    %ת���޸���������������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Tcpu = toc;    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
