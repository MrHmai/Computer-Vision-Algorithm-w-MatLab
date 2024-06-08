%No.1 rotate img by 45 degrees by using forward wraping and save as rotate_0.jpg 
img = imread('01.jpg'); 

a = 45; 
x0 = 200; 
y0 = 150; 

canvas = zeros (300, 400, 3, 'uint8'); 

for y1 = 1:300 
    for x1 = 1:400 
        y2 = round(-sin(a)*(x1-x0) + cosd(a)*(y1-y0) + y0);
        x2 = round(cosd(a)*(x1-x0) + sind(a)*(y1-y0) + x0);
        if (y2 >= 1 && y2 <= 300 && x2 >= 1 && x2 <= 400)
            canvas(y2, x2, :) = img(y1, x1, :);
        end 
    end 
end 

figure, imshow(canvas),title('Img 45 degrees rotation via forward warping');
fprintf('writing rotate_0.jpg..\n');
imwrite(canvas,'rotate_0.jpg');

%No.2 rotate img by 45 degrees by using backward wraping and save as rotate_0.jpg
img = imread('01.jpg');

a = 45; 
x0 = 200; 
y0 = 150; 

canvas=zeros(300, 400, 3, 'uint8');

for y2 = 1:300 
    for x2 = 1:400
        x1 = round(cosd(a)*(x2-x0) - sind(a)*(y2-y0) + x0);
        y1 = round(sind(a)*(x2-x0) + cosd(a)*(y2-y0) + y0);
        if (y1 > 1 && y1 <= 300 && x1 >= 1 && x1 <= 400)
            canvas(y2, x2, :) = img(y1, x1, :); 
        end 
    end 
end 
figure, imshow(canvas), title('Img 45 rotation via backward warping')
imwrite(canvas, 'rotate_1.jpg'); 
%% 

%No.3 implement median_filter for lena_noisy.jpg, patch size is three, and
%save as median_1.jpg 
lena = im2double(imread('lena_noisy.jpg'));
patch_size = 3; 

img_median_0 = median_filter(lena, patch_size); 
figure, imshow(img_median_0), title('Median Filter with Patch size 3');
imwrite(img_median_0, 'median_0.jpg');
%% 

%No.4 implement median_filter for lena_noisy.jpg, patch size is three, and
%save as median_1.jpg
patch_size = 5; 

img_median_1 = median_filter(lena, patch_size);
figure, imshow(img_median_1), title('Median Filter With Patch Size 5')
imwrite(img_median_1, 'median_1.jpg')