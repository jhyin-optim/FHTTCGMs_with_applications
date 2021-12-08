function [Tcpu,Itr,tpc_img] = TwoPhaseCG(img,Nmax,para,method,xs)
    tic;                                                          %% start clock
    [m,n]=size(img);mm = m+2*Nmax+1;  
    imgn=zeros(m+2*Nmax+1,n+2*Nmax+1); 
    imgn(Nmax+1:m+Nmax,Nmax+1:n+Nmax)=img;
    imgn(1:Nmax,Nmax+1:n+Nmax)=img(1:Nmax,1:n);                    %扩展上边界
    imgn(1:m+Nmax,n+Nmax+1:n+2*Nmax+1)=imgn(1:m+Nmax,n:n+Nmax);    %扩展右边界
    imgn(m+Nmax+1:m+2*Nmax+1,Nmax+1:n+2*Nmax+1)=imgn(m:m+Nmax,Nmax+1:n+2*Nmax+1);    %扩展下边界
    imgn(1:m+2*Nmax+1,1:Nmax)=imgn(1:m+2*Nmax+1,Nmax+1:2*Nmax);                      %扩展左边界
    re=imgn;
    N = zeros(m*n,1);u = zeros(m*n,1);
    V = zeros(m*n,4);tmp_index = 0;
    for i=Nmax+1:m+Nmax
        for j=Nmax+1:n+Nmax
            r=1;                                %邻域半径
            while r~=Nmax
                W=imgn(i-r:i+r,j-r:j+r);
                Imin=min(W(:));
                Imax=max(W(:));
                Imed=median(W(:));
                if Imin<Imed && Imed<Imax       %如果当前邻域中值不是噪声点，那么就用此次的邻域
                   break;
                else
                   r=r+2;                       %否则扩大窗口，继续判断 %r=r+1;
                end          
            end
            
            if Imin<imgn(i,j) && imgn(i,j)<Imax %如果当前这个像素不是噪声，原值输出
                re(i,j)=imgn(i,j);
            else                                %否则记录当前噪声点的位置及其4个最邻近位置,采用的matlab列主序方式
                tmp_index = tmp_index + 1;      %%%%%%%%%%%%%%%%%%%%%%%%4月1日%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                u(tmp_index) = imgn(i,j);       %1;  Imed;%                                     %$$$$$$$$$  %Imed; 
                N(tmp_index) = (j-1)*mm+i;                                              
                V(tmp_index,:) = [(j-2)*mm+i,(j-1)*mm+(i+1),j*mm + i,(j-1)*mm+(i-1)];   %左 下 右 上
            end
        end
    end
    N = N(1:tmp_index);
    u = u(1:tmp_index);
    V = V(1:tmp_index,:);
    [Itr,re(N)] = CGMWWP(u,N,V,imgn,para,method,xs);   %re(N) = rescale(re(N))*255; %rescale  将数组中的元素缩放到区间【0，1】
    nimg = re(Nmax+1:m+Nmax,Nmax+1:n+Nmax);
    tpc_img = uint8(nimg);                    %转变修复后矩阵的数据类型%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Tcpu = toc;    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
