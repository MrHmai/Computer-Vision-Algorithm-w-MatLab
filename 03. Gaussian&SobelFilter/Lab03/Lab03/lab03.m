img = im2double(imread('lena.jpg'));

%implementing sobel filter
%Horizontal Matrix 
%H = [1,2,1,; 0,0,0; -1,-2,-1];
%vertical Matrix
H = [1, 0, -1; 2, 0, -2; 1, 0, -1];

sobel_img = sobel_filter(img,H);
figure,imshow(sobel_img);
imshow(sobel_img); 
imwrite(sobel_img, 'sobel_v.jpg')
%% Lab3 partition for gaussian filter main call function 

img = im2double(imread('lena.jpg'));
hsize = 5; 
sigma = 2; 
img_gaussian = gaussian_filter (img, hsize, sigma);

figure, imshow(img_gaussian)
imwrite(img_gaussian, 'gaussian_5.jpg')
