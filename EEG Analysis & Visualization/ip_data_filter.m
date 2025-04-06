function [data, low, upper, noise_num] = ip_data_filter(subject_num)
%% ____________________
%% INITIALIZATION
    fprintf("\n<strong>EEG Data Filtering Begins</strong>\n")
    currentPath = "/Users/mixuan/Desktop/Ulty_Multy";
    fileName = "sub-" + int2str(subject_num) + "_task-SemanticCategorization_eeg.set"; % the file for reading EEG data
    filePath = fullfile(currentPath, "data", "sub-" + int2str(subject_num), "eeg"); % the path for the EEG data file 
    cd(filePath); % change to file directory 
    EEG = pop_loadset(char(fileName)); % load eeg data list from the data of user-chosen subject
        % use char() to avoid '.set' being truncated 
    cd(currentPath); % change to working directory 
    checker = true; % while loop control variable 
    checker2 = true; % another loop control variable 
    low = 0; % initialize the lower bound
    upper = 0; % initialize the upper bound 
    noise_num = 0; % initialize the powerline to be removed 
%% ____________________
%% CALCULATIONS
    while checker % bandpass filter bounds from user input 
        indicator = input("Do you want to bandpass filter (y/n)? ", 's');
        if strcmp(lower(indicator), "y")
            while checker2
                low = input("Enter the lower bound in Hz: ");
                if low < 0.1
                    fprintf("Entered lower bound is too small!\n")
                    fprintf("Please enter a positive number greater or equal to 0.1 Hz!\n")
                else
                    checker2 = false;
                end
            end
            checker2 = true;
            while checker2
                upper = input("Enter the upper bound in Hz: ");
                if upper > 40
                    fprintf("Entered upper bound is too high!\n")
                    fprintf("Please enter a positive number smaller than 40 Hz!\n")
                elseif upper < low
                    fprintf("Entered upper bound is too low!\n")
                    fprintf("Upper bound must be higher than lower bound!\n")
                else
                    checker2 = false;
                end
            end
            EEG = pop_eegfiltnew(EEG, low, upper); % Bandpass filter in the desired Hz range 
            checker = false;
        elseif strcmp(lower(indicator), "n")
            checker = false;
        end
    end
    

    checker = true;
    while checker % noise removal 
        indicator = input("Do you want to remove a specific powerline (y/n)? ", 's');
        if strcmp(lower(indicator), 'y')
            noise_num = menu("Enter the notch filter to be filtered out", "50 Hz (common in Europe and most countries)", "60 Hz (common in North America)"); 
            noise_num = 40 + 10 * noise_num; % convert 1, 2 (index) to 50, 60 (notch filter)
            EEG = pop_eegfiltnew(EEG, noise_num - 1, noise_num + 1, [], 1); % notch filter 
            checker = false;
        elseif strcmp(lower(indicator), 'n')
            checker = false;
        else
            fprintf("Please enter either 'y' or 'n'\n"); 
        end
    end
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
    data = EEG; % function output 
    fprintf("\nEEG Data Filtering Successful\n");
%% ____________________
end 