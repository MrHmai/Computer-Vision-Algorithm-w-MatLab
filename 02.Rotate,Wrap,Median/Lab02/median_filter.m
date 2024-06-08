function output = median_filter(img, patch_size)
    output = zeros(size(img));
    for u=ceil(patch_size/2) : size(img, 2) - floor(patch_size/2)
        for v = ceil(patch_size/2) : size(img,1) - floor(patch_size/2)
            patch = img(v-floor(patch_size/2):v+floor(patch_size/2), u-floor(patch_size/2):u+floor(patch_size/2));
            output(v,u) = median(patch(:));
        end 
    end 
end