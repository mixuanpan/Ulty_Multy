function ip_brain_plot(data, subject_num)
%% ____________________
    %% INITIALIZATION
    EEG = data; % EEG data from user input 
    chanlocs = EEG.chanlocs; % extract channel locations 
    
    %% ____________________
    %% CALCULATIONS
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv", subject_num, subject_num), "FileType", "text", "Delimiter", "\t");
    % extract the channels for the given subject number from the file
    labels = channels.name; % extract the name column of the channels to show in the final 3D graph
    
    %% ____________________
    %% FORMATTED TEXT & FIGURE DISPLAYS
    figure;
    hold on;
    
    % iterate through each EEG channel as a point 
    for i = 1:length(chanlocs)
        if ~isempty(labels{i}) % Check if the label exists
            % locates each channel to the correct coordination
            plot3(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z); 
            
            % add each label name to the data points 
            text(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z, ...
                labels{i}, 'FontSize', 10, 'FontWeight', 'bold', 'HorizontalAlignment', 'left');
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
    %% ____________________
end