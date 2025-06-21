function [filtered_data] = ip_data_filter(EEG, low, upper, noise_num)
    % bandpass filter 
    if low ~= 0 && upper ~= 0
        % both "low ~= 0" and "upper ~= 0" are numeric scales ->
        % use && instead of & for performance 
        EEG = pop_eegfiltnew(EEG, low, upper); % Bandpass filter in the desired Hz range 
    end
    % noise removal 
    if noise_num ~= 0
        EEG = pop_eegfiltnew(EEG, noise_num - 1, noise_num + 1, [], 1); % notch filter 
    end

    filtered_data = EEG; % function output 
end 