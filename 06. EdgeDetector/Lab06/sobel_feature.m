
function [magnitude, orientation] = sobel_filtering(img)

    hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    hx = [1, 0, -1; 2, 0, -2; 1,0, -1];

    Gy = imfilter(img, hy);
    Gx = imfilter(img, hx);

    magnitude = sqrt(Gy.^2 + Gx.^2);
    orientation = atan2(Gy, Gx);
end