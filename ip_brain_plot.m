function ip_brain_plot(data, subject_num)
%% ____________________
    %% INITIALIZATION
    EEG = data; % EEG data from user input 
    chanlocs = EEG.chanlocs; % extract channel locations 
    
    %% ____________________
    %% CALCULATIONS
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv", subject_num, subject_num), "FileType", "text", "Delimiter", "\t");
    labels = channels.name;
    
    %% ____________________
    %% FORMATTED TEXT & FIGURE DISPLAYS
    figure;
    hold on;
    
    % each EEG channel as a point 
    for i = 1:length(chanlocs)
        plot3(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z, 'r', 'MarkerSize', 50); % red dots for channels 
    end
    hold on;
    
    % add each label to the data points 
    for i = 1:length(chanlocs)
        if ~isempty(labels{i}) % Check if the label exists
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
    %axis equal;
    grid on;
    %% ____________________
end