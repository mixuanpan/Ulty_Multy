function ip_final_display(subject_num, low, upper, noise_num, freqs, power_spec)
    % compare the target to all of the subjects 
    % Data Packaging 

    %% Initialization 
    fprintf("\n<strong>Final Analysis Results:</strong>\n\n");
    subject_count = 27; % There are a total of 27 subjects with 3 missing data 
    invalid_num = [14 15 25]; % no subjects found 
    current_subject = 1; % subjects to iterate through, starting from 1
    currentPath = "/Users/mixuan/Desktop/Ulty_Multy"; % data directory 
    resultsPath = "/Users/mixuan/Desktop/Ulty_Multy/Results"; % results directory 
    channels_num = 32; % number of channels in the given data 
    
    %% ip_brain_plot.m
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv", subject_num, subject_num), "FileType", "text", "Delimiter", "\t");
    labels = channels.name;
    % names of the 32 channels 

    % iterate through each subject to analyze and get the data 
    while current_subject <= subject_count
        %% ip_subject_info.m
        % check if the current subject is the target subject 
        current_subject = current_subject + (current_subject == subject_num) * (current_subject < subject_count);
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
        fig = figure("Visible", "off"); % Set the figure to be invisible 
        layout = tiledlayout(4, 8, 'Padding', 'compact', 'TileSpacing', 'compact'); % % 4 rows, 8 columns for 32 subplots
        for ch = 1:channels_num
            % Wavelet Decomposition for each channel 
            power_data = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', [1, 60]); % power data for this specific channel 
            % only need the power data, neglecting the frequency 
            nexttile;
            plot(freqs, abs(power_data), 'Color', [0.7, 0.7, 0.7, 0.03]); % Compared subject data in gray 
            hold on; % stay on the same figure 
            plot(freqs, abs(power_spec{ch}), 'Color', [1, 0, 0, 0.006], "LineWidth", 1.5); % Target subject data in red
            title(sprintf("%s", labels{ch}), "FontWeight", "bold", 'Units', 'normalized', 'Position', [1, 1, 1]); % Channel name for each subplot 
        end 

        % Graph formatting for all subplots 
        xlabel(layout, "Frequency (Hz)", "FontWeight", "bold"); % overall y label 
        ylabel(layout, "Power (VA)", "FontWeight", "bold"); % overall x label 
        title(layout, sprintf("Subject %i - Gray vs. Target Subject - Red (%i)", current_subject, subject_num)); % overall title 
        
        saveas(fig, fullfile(resultsPath, sprintf("output_%i.png", current_subject))); % save the graph file 
        close(fig); % close the current figure 

        fprintf("\n<strong>Final display progress: subject %i</strong>\n\n", current_subject);
        current_subject = current_subject + 1; % change to the next subject 
    end

    
end