clear;clc;
close all;
format long
format compact

%% 建立latex表格文件
fid_tex=fopen('mytext.txt','w');               

%% Set parameters 
para.Itrmax = 300;  
para.alpha = 100;   
para.NLmax = 10;
para.Tol = 0.0001;  
para.delta = 0.01;
para.sigma = 0.1;

addpath Images
A = {'lena.png','hill.png','man(512).png','boat.png','bridge.bmp','baboon.bmp','shape.jpg','barbara.png','man.bmp','brain.bmp','cameraman.png',  ...
     'chart.tiff','peppers.bmp' }; 

 % store noise ratio and 窗口
aa = [0.3 7;0.5 9;0.7 17;0.9 27];   
for j = 1:4                
    for i = 1:4            
        noiseRatio = aa(i,1);
        maxWL = aa(i,2);

        org_img = imread(A{j});
        rng('default')                                            
        img=imnoise(org_img,'salt & pepper',noiseRatio);          
        
        %% 两阶段图像处理
         [Tcpu1,Itr1,tpc_img1] = TwoPhaseCG(img,maxWL,para,'FHTTCGM_N',1);  
         [Tcpu2,Itr2,tpc_img2] = TwoPhaseCG(img,maxWL,para,'PRP',2);
         [Tcpu3,Itr3,tpc_img3] = TwoPhaseCG(img,maxWL,para,'PRP',1);
         [Tcpu4,Itr4,tpc_img4] = TwoPhaseCG(img,maxWL,para,'HZ',1);
    
        psnr1 = PSNR(tpc_img1,org_img);   psnr2 = PSNR(tpc_img2,org_img);   psnr3 = PSNR(tpc_img3,org_img);   psnr4 = PSNR(tpc_img4,org_img);  
        fprintf(fid_tex,'%s/%.2f & %.0f&%.2f&%.2f & %.0f&%.2f&%.2f & %.0f&%.2f&%.2f & %.0f&%.2f&%.2f\\\\ \r\n',...
               char(A(j)),noiseRatio,Itr1,Tcpu1,psnr1,Itr2,Tcpu2,psnr2,Itr3,Tcpu3,psnr3,Itr4,Tcpu4,psnr4);
        %% 画图
        if noiseRatio == 0.7 || noiseRatio==0.9
        figure;           
        imshow(org_img);title('Original'); 
        figure;
        noiseRatio = num2str(noiseRatio*100,2);
        imshow(img);title(['Original with ',noiseRatio,'% salt-and-pepper noise']);
        figure;
        imshow(tpc_img1);title('FHTTCGM');
        figure;
        imshow(tpc_img2);title('PRP');
        figure;
        imshow(tpc_img3);title('PRP-W');
        figure;
        imshow(tpc_img4);title('HZ');
        end
    end  %i
end  %j