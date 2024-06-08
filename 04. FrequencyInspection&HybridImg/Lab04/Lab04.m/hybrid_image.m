function merged_image = hybrid_image(img1, img2, ratio)
    % split img_1 and img_2 into low and high frequencies
    [low_pass_img1, high_pass_img1] = separate_frequency(img1, ratio);
    [low_pass_img2, high_pass_img2] = separate_frequency(img2, ratio);
    % combine the low frequency of img_1 and the high_frequency of img_2
    
    merged_image = low_pass_img1 + high_pass_img2;
end