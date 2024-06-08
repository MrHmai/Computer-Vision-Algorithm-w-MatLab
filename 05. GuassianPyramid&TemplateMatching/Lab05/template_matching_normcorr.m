function [normcorr_output, normcorr_match] = template_matching_normcorr(img, template, threshold)

    normcorr_output = zeros(size(img));
    img_height = size(img, 1);
    img_width = size(img, 2);
    template_height = size(template, 1);
    shift = floor(template_height/2);
    
    for y = 1 + shift : img_height - shift
        for x = 1 + shift : img_width - shift 
            patch = img(y-shift:y+shift, x-shift:x+shift);
            
            % Normalize patch and template
            patch_mean = mean(patch(:));
            patch_norm = patch - patch_mean;
            patch_norm = patch_norm / norm(patch_norm(:));
            
            template_mean = mean(template(:));
            template_norm = template - template_mean;
            template_norm = template_norm / norm(template_norm(:));
            
            % Calculate normalized correlation
            normcorr = sum(sum(patch_norm .* template_norm));
            normcorr_output(y, x) = normcorr;
        end
    end
    %return threshold 
    normcorr_match = (normcorr_output > threshold);
end
