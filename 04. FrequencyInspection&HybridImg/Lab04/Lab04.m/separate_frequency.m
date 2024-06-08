function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    % Apply FFT to input image
    frequency_map = fft2(img);

    % Shift frequency map
    shifted_frequency_map = fftshift(frequency_map);

    % Compute low-frequency mask
    [M, N] = size(shifted_frequency_map); % get size of frequency map
    mask = zeros(size(shifted_frequency_map));
    patch_size = round([M,N].*ratio);
    mask((M-patch_size(1))/2+1:(M+patch_size(1))/2, (N-patch_size(2))/2+1:(N+patch_size(2))/2) = 1;

    % Separate low-frequency and high-frequency maps
    low_freq_map = shifted_frequency_map .* mask;
    high_freq_map = shifted_frequency_map .* (1 - mask);

    % Shift frequency maps back
    shifted_low_freq_map = ifftshift(low_freq_map);
    shifted_high_freq_map = ifftshift(high_freq_map);

    % Apply Inverse FFT to frequency maps to get images
    low_pass_img = real(ifft2(shifted_low_freq_map));
    high_pass_img = real(ifft2(shifted_high_freq_map));
end
