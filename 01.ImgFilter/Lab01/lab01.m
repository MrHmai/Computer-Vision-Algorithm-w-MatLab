%*Hao D Mai
%*Lab01 
% CSE 185

%No.1 set green channel to zero and save as green.jpg
%using imread, imshow and imwrite 
I = imread('01.jpg');
%applied matrix filter 
I(:,:,2) = 0;  
imwrite(I,'green.jpg');
imshow(I);

%No.2 Convert from RGB to grayscale and save as gray.jpg 
x = imread("01.jpg");
%applied fromula from lecture 
J = 0.299 * I(:,:,1) + 0.587 * I(:,:,3) + 114 * I(:,:,2);
imwrite(J, 'gray.jpg');
imshow(J);

%No.3 Rotate img 90 degrees and save as rotate.jpg 
I = imread("01.jpg");
% applying the rotate operator 
J = imrotate(I,90);
imwrite(J,"rotate.jpg");
imshow(J);

%No.4 Crop the img given at point (30,100) and (270,300) and save as flip.jp
I = imread("01.jpg");
%cropping the img via desire point by applying extract sub-matrix manipulation 
L = I(30:270 , 100:300, :); 
imshow(J);
imwrite(L ,"crop.jpg");

%No.5 Applying the flip operator
I = imread("01.jpg");
J = flip(I,1);
imshow(J);
imwrite(J,"flip.jpg");

%No.6 Combine img 1-4 into one 2x2 matrix 
i1 = imread("01.jpg");
i2 = imread("02.jpg");
i3 = imread("03.jpg");
i4 = imread("04.jpg");
% creation of matrix size to hold img matrix value 
J = zeros(300 * 2 + 15, 400 * 2 + 15, 3,'uint8');
J(1:300, 1:400, 1:3) = i1; 
J(1:300, 416:815, 1:3) = i2; 
J(316:615, 1:400, 1:3) = i3; 
J(316:615, 416:815, 1:3) = i4; 
imshow(J);
imwrite(J,"combine.jpg");

%No.7 turn img 5 & 6 into vectors, avg those vectors, and use reshape
%operator to print out the two image as overlay avg 
i5 = imread("05.jpg");
i6 = imread("06.jpg");
vec1  = i5(:);
vec2 = i6(:);
vavg = (vec1 + vec2) * 1/2; 
vavg = reshape(vavg, 375, 1242, 3);
imshow(vavg);
imwrite(vavg,"Average.jpg");


