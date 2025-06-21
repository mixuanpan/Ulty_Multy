function [channels_num, power, freqs] = ip_time_frequency_analysis(input_data)
%% ____________________
%% INITIALIZATION
    fprintf("\n<strong>Time Frequency Analysis</strong>\n"); % inform the user of the analysis type 
    EEG = input_data;
    channels_num = size(EEG.data, 1); % number of channels 
    power = cell(1, channels_num); % a cell array to store power 
        % cell arrays contain elements with different types 
    freqs = []; % frequency initialization 
    checker = true; % loop control variable 
%% ____________________
%% CALCULATIONS
% Wavelet Decomposition for each (typically 32) channel 
    for ch = 1:channels_num
        [power{ch}, freqs] = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', [1, 60]);
    end
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
% Power Spectrum for individual channels 
    while checker 
        checker2 = true; % loop control variable 
        while checker2 
            channel = input("\n\nWhich channel would you like to visualize? ");
            if ~isnumeric(channel)
                fprintf("\nPlease enter a numeric value!\n");
            elseif isnumeric(channel) & (channel < 1 | channel > channels_num)
                fprintf("\nPlease enter a number between 1 and %i!\n", channels_num);
            else
                checker2 = false;
            end
        end
        figure;
        imagesc([], freqs, abs(power{channel})); % plot power magnitude 
        xlabel("Time (ms)");
        ylabel("Frequency (Hz)");
        title(["Time-Frequency Representation: Channel ", num2str(channel)]);
        colorbar;

        waitfor(gcf); % wait until the figure is closed by the user
        checker2 = input("Do you want to visualize another channel (y/n)? ", "s");
        if strcmp(lower(checker2), "n")
            checker = false;
        elseif ~strcmp(lower(checker2), "y")
            fprintf("\nInput Error!!\n\n");
            checker = false;
        end
    end
%% ____________________
%% COMMAND WINDOW OUTPUT
    fprintf("\nTime Frequency Analysis and Visualization Successful.\n");
%% ____________________
end 