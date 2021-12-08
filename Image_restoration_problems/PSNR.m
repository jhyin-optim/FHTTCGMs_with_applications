function psnr = PSNR(r_img,img)
%      img = uint8(rescale(img)*255);
%     r_img = uint8(rescale(r_img)*255);
%     [M,N] = size(r_img);
    img = double(img);%uint8(img);     %
    r_img = double(r_img);%uint8(r_img); %double(img);%
    [M,N] = size(r_img);
    MN = M*N;
    psnr = 10*log10(255^2/(sum(sum((r_img-img).^2))/MN));
end