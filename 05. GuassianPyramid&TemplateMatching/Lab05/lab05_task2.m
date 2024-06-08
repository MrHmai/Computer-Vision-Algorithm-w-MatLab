% read images
img1 = im2double(imread('einstein1.jpg'));
img2 = im2double(imread('einstein2.jpg'));
template = im2double(imread('template.jpg'));

% template matching using SSD img1
ssd_threshold1 = 25;
[ssd_output1, ssd_match1] = template_matching_SSD(img1, template, ssd_threshold1);
figure, imshow(ssd_output1 ./ max(ssd_output1(:))); 
title('SSD output');
figure, imshow(ssd_match1); 
imwrite(ssd_output1, sprintf('einstein1_ssd_output.jpg'));
title('SSD match');
imwrite(ssd_match1, sprintf('einstein1_ssd_match.jpg'));

% template matching using SSD  img2
ssd_threshold2 = 36;
[ssd_output2, ssd_match2] = template_matching_SSD(img2, template, ssd_threshold2);
figure, imshow(ssd_output2 ./ max(ssd_output2(:))); 
title('SSD output');
figure, imshow(ssd_match2); 
imwrite(ssd_output2, sprintf('einstein2_ssd_output.jpg'));
title('SSD match');
imwrite(ssd_match2, sprintf('einstein2_ssd_match.jpg'));

% template matching img1
normcorr_threshold1 = 0.5;
[normcorr_output1, normcorr_match1] = template_matching_normcorr(img1, template, normcorr_threshold1);
figure, imshow(normcorr_output1 ./ max(normcorr_output1(:))); 
title('NormCorr output');
imwrite(normcorr_output1, sprintf('einstein1_normcorr_output.jpg'));
figure, imshow(normcorr_match1); 
title('NormoCrrelation match');
imwrite(normcorr_match1, sprintf('einstein1_normcorr_match.jpg'));

% template matching img2
normcorr_threshold2 = 0.5;
[normcorr_output2, normcorr_match2] = template_matching_normcorr(img2, template, normcorr_threshold2);
figure, imshow(normcorr_output2 ./ max(normcorr_output2(:))); 
title('NormCorr output');
imwrite(normcorr_output2, sprintf('einstein2_normcorr_output.jpg'));
figure, imshow(normcorr_match2); 
title('NormCorr match');
imwrite(normcorr_match2, sprintf('einstein2_normcorr_match.jpg'));

