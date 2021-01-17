function PSNR=psnrcc(im1,im2)

    [m, n, dim] = size(im1);
    if (dim == 3)
    	A = double(rgb2gray(im1));
    	B = double(rgb2gray(im2));
    else
    	A = im1;
    	B = im2;
    end
    D = sum( sum( (A-B).^2 ) );
    MSE = D / (m * n);
if  D == 0
    PSNR = 100;
else
    PSNR = 10*log10( (255^2) / MSE );
end