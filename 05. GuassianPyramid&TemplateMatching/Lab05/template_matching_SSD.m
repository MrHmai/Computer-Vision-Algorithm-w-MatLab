function [output, match] = template_matching_SSD(I1, template, threshold)
    % calculate patch size
    patch_size = size(template);
    patch_size = patch_size(1:2);

    %calc half size of template 
    hsize = floor(patch_size ./ 2);

    % calc shift considering hsize and shift 
    shift_u = hsize(2);
    shift_v = hsize(1);

    % initialize
    output = zeros(size(I1, 1), size(I1, 2));

    % iterate through imag, calc SSD for each patch
    for u = 1 + shift_u : size(I1, 2) - shift_u
        for v = 1 + shift_v : size(I1, 1) - shift_v
            % calculate patch coordinates
            x1 = u - hsize(2);
            x2 = u + hsize(2);
            y1 = v - hsize(1);
            y2 = v + hsize(1);

            % extract patch from image
            patch = I1(y1:y2, x1:x2);

            % calculate SSD
            diff = patch - template;
            value = sum(diff(:).^2);

            % store SSD value in output
            output(v, u) = value;
        end
    end

    % create binary mask of matched regions based on threshold
    match = (output < threshold);
end

