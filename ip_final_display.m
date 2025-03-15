function ip_final_display(subject_num, low, upper, noise_num, freqs, power_spec)
    % compare the target to all of the subjects 
    % Data Packaging 

    %% Initialization 
    fprintf("\n<strong>Final Analysis Results:</strong>\n\n");
    subject_count = 2; % There are a total of 27 subjects with 3 missing data 
    invalid_num = [14 15 25]; % no subjects found 
    current_subject = 1; % subjects to iterate through, starting from 1
    currentPath = "/Users/mixuan/Desktop/Ulty_Multy"; % data directory 
    resultsPath = "/Users/mixuan/Desktop/Ulty_Multy/Results"; % results directory 
    channels_num = 32; % number of channels in the given data 
    outputFileName = "output.txt"; % txt file that stores the output 
    fileID = fopen(fullfile(resultsPath, outputFileName), 'wt'); % open the output file for writing 
    % overwrites the file if it already exist 

    % iterate through each subject to analyze and get the data 
    while current_subject <= subject_count
        %% ip_subject_info.m
        % check if the current subject is the target subject 
        current_subject = current_subject + (current_subject == subject_num);
        % check if the subject number is invalid 
        if current_subject >= invalid_num(1) && current_subject <= invalid_num(end)
            for i = 1:length(invalid_num)
                current_subject = current_subject + (current_subject == invalid_num(i));
            end
        end
        
        %% ip_data_filter 
        % filter each subject data with the bandwith given to the target
        % subject 
        fileName = "sub-" + int2str(current_subject) + "_task-SemanticCategorization_eeg.set"; % the file for reading EEG data
        filePath = fullfile(currentPath, "data", "sub-" + int2str(current_subject), "eeg"); % the path for the EEG data file 
        cd(filePath); % change to file directory 
        EEG = pop_loadset(char(fileName)); % load eeg data list from the current subject 
        cd(currentPath) % back to script directory 
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
        
        %% ip_time_frequency_analysis.m 
        for ch = 1:channels_num
            % Wavelet Decomposition for each channel 
            power_data = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', [1, 60]); % power data for this specific channel 
            % only need the power data, neglecting the frequency 
            % formatting for the output file 
            fprintf(fileID, "%i\t%i\t%f\t", current_subject, ch, abs(power_data)); % write power data as a tab-separated value 
            fprintf(fileID, "\n"); % next line -> next channel 
        end 
        
        % fprintf("\n<strong>Final display progress: subject %i</strong>\n\n", current_subject);
        current_subject = current_subject + 1; % change to the next subject 
    end
    fclose(fileID); % close the output file for writing 

    %% ip_brain_plot.m
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv", subject_num, subject_num), "FileType", "text", "Delimiter", "\t");
    labels = channels.name;
    % names of the 32 channels 

    %% FORMATTED TEXT & FIGURE DISPLAYS
    % read the data back from the output file 
    fileID = fopen(fullfile(resultsPath, outputFileName), "r"); % open the output file for reading 
    % output_data = textscan(fileID, "Subject %d, Channel %d, %s", "Delimiter", "\n"); % read data into a cell array 
    % data{1}: subject number, data{2}: channel number, data{3}: power
    % values (as a single string) 
    % fclose(fileID);

    % Parsing Data: Convert the power values from strings back to numerical
    % form
    % power_all = cell(subject_count, channels_num);
    % for i = 1:length(data{1})
    %     subject = data{1}{i};
    %     channel = data{2}{i};
    %     power_values = str2num(data{3}{i});
    %     power_all{subject, channel} = power_values; 
    % end

    % Plotting 
    figure; % initialize a single window figure 
    for ch = 1:channels_num
        subplot(4, 8, ch); % subplots for each channel 
        hold on;
        fseek(fileID, 0, 'bof'); % Rewind the file to the beginning
        %for sub = 1:subject_count
        while ~feof(fileID)
            line = fgetl(fileID); % read line by line 
            if isempty(line)
                continue;
            end
            % Parse the line
            C = textscan(line, 'Subject %d, Channel %d, %s', 'Delimiter', '\n');
            subject = C{1};
            channel = C{2};
            power_data = str2double(C{3}{1}); % Convert power data from string to numeric
            
            % If the channel matches the current one, plot it
            if channel == ch
                if subject == subject_num
                    plot(freqs, abs(power_spec{ch}), "r", "LineWidth", 1.5); % Target subject in red
                    % since the power has imaginary parts, we plot the absolute
                    % value 
                %elseif ~isempty(power_all{sub, ch})
                else
                    % power cells for invalid subjects will be empty 
                    plot(freqs, abs(power_data(subject, channel)), 'Color', [0.7, 0.7, 0.7]); % Other subjects in gray  
                end
            end

            % Graph Labels 
            xlabel("Frequency (Hz)");
            ylabel("Absolute Power (W)");
            title(sprintf("Channel %d: %s", ch, labels{ch}));
            
            % add legend for the first channel only 
            if ch == 1
                legend("Target Subject", "Other Subjects");
            end
            hold off;
        end
        fclose(fileID); % close file
    end
end