function labels = ip_brain_plot(data, subject_num)
%% ____________________
    %% INITIALIZATION
    EEG = data; % EEG data from user input 
    chanlocs = EEG.chanlocs; % extract channel locations 
    checker = true; % loop control variable 
    %% ____________________
    %% CALCULATIONS
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv", subject_num, subject_num), "FileType", "text", "Delimiter", "\t");
    % extract the channels for the given subject number from the file
    labels = channels.name; % extract the name column of the channels to show in the final 3D graph
    %% ____________________
    %% FORMATTED TEXT & FIGURE DISPLAYS
    fprintf("\n<strong>Brain Plotting Begins</strong>\n");
    % ask the user if they want to highlight a specific channel 
    while checker 
        indicator = input("Do you want to highlight a specific channel (y/n)? ", "s");
        if strcmp(lower(indicator), "n")
            checker = false; 
        elseif strcmp(lower(indicator), "y")
            checker = false;
            highlight = menu("Choose the channel name that you want it to be highlighted.", labels);
        else
            fprintf("Please enter 'y' or 'n'!\n");
        end
    end

    figure;
    hold on;

    % iterate through each EEG channel as a point 
    for i = 1:length(chanlocs)
        if ~isempty(labels{i}) % Check if the label exists
            % locates each channel to the correct coordination
            plot3(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z); 
            
            % determine highlight 
            if exist("highlight", "var") & i == highlight
                % variable "highlight" doesn't exist if the user didn't
                % specify it 
                color = "red";
            else 
                color = "black"; % the color of the highlighted channel on the 3D brain map, default black 
            end 

            % add each label name to the data points 
            text(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z, ...
                labels{i}, 'FontSize', 10, 'FontWeight', 'bold', 'HorizontalAlignment', 'left', 'Color', color);

        end
    end
  
    % professional naming of the plot 
    xlabel("X");
    ylabel("Y");
    zlabel("Z");
    title("3D Representation of EEG Channels");
    
    % adjust view angle
    view(3);
    % axis equal;
        % since brain is not a sphere, we need the relative scale of X, Y
        % and Z
    grid on;
    waitfor(gcf); % wait until the graph is closed to proceed to the next step
    %% ____________________
end