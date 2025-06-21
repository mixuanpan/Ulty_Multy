function EEG = ip_eeg_load(subject_num)
    currentPath = pwd; % current directory 
    fileName = "sub-" + int2str(subject_num) + "_task-SemanticCategorization_eeg.set"; % the file for reading EEG data
    filePath = fullfile(currentPath, "data", "sub-" + int2str(subject_num), "eeg"); % the path for the EEG data file 
    cd(filePath); % change to file directory 
    EEG = pop_loadset(char(fileName)); % load eeg data list from the data of user-chosen subject
        % use char() to avoid '.set' being truncated 
    cd(currentPath); % change to working directory 
end