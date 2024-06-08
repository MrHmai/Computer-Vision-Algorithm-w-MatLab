img = imread('lena.jpg');
img = im2double(img);
sigma = 2.0; 
hsize = 7; 
scale = 5; 

%%Gaussian Pyramid 
I = img; 
for s = 1 : scale 

    %Gaussian filter implementation 
    filter = fspecial('gaussian', hsize, sigma);
    I = imfilter(I, filter, 'replicate');

    %Laplacian filter implementation
    I2 = imresize(I, size(img), 'bilinear');
    filter2 = imfilter(I2, filter,'replicate');
    diff = img - filter2;
    img = filter2;

    %Save and or show Img 
    imshow(I);
    imwrite(I, sprintf('gaussian_scale%d.jpg', s));
    figure; 
    %------------------------%
    imshow(diff);
    imwrite(diff + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    figure;

    %Down-sampling 
    I = imresize(I, 0.5);


end 
