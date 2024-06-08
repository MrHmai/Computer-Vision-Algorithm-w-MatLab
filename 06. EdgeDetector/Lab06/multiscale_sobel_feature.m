function feature = multiscale_sobel_feature(img, scale)
   %initalize the feature
    feature = []; 

    for i = 1:scale 
        [magnitude, orientation] = sobel_feature(img);
        f = magnitude; 

        %concatenate the feature and vector
        feature = cat(1, feature, f(:));

        % down-sample image by 2
        img = imresize(img, 0.5);

    end 