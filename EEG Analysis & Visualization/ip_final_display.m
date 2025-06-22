function ip_final_display( ...
    filtered_data, invalid_num, subject_num, channels_num, noise_num, ...
    low, upper, freqs, power_spec, labels)
    % compare the target to all of the subjects 
    % Data Packaging 

    %% Initialization 
    fprintf("\n<strong>Final Analysis Results:</strong>\n\n");
    subject_count = 27; % There are a total of 27 subjects with 3 missing data 
    current_subject = 1; % subjects to iterate through, starting from 1
    
    % iterate through each subject to analyze and get the data 
    while current_subject <= subject_count
        % check if the current subject is the target subject 
        current_subject = current_subject + (current_subject == subject_num) * (current_subject < subject_count);
        % check if the subject number is invalid 
        if current_subject >= invalid_num(1) && current_subject <= invalid_num(end)
            for i = 1:length(invalid_num)
                current_subject = current_subject + (current_subject == invalid_num(i));
            end
        end
        
        if current_subject == subject_num
            EEG = filtered_data;
        else
            % data filtering 
            EEG = ip_eeg_load(current_subject);
            EEG = ip_data_filter(EEG, low, upper, noise_num);
        end
        
        % Results - Absolute Power 
        ip_powerline_graph(current_subject, subject_num, "absolute", EEG, freqs, power_spec, labels, channels_num);
        
        % Results - Polar 
        ip_powerline_graph(current_subject, subject_num, "polar", EEG, freqs, power_spec, labels, channels_num);

        fprintf("\n<strong>Final display progress: subject %i</strong>\n\n", current_subject);
        current_subject = current_subject + 1; % change to the next subject 
    end

    
end