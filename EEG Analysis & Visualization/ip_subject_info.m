function subject_num = ip_subject_info(invalid_num)
%% ____________________
%% INITIALIZATION
    len = length(invalid_num); % number of invalid numbers 
    checker = true; % while loop control variable 
    bool = true; % loop control variable 
%% ____________________
%% CALCULATIONS
    while checker % subject_num error check 
        subject_num = input("Which subject are you looking for? Enter a number between 1 and 27 (inclusive) --> "); % subject number from user input
        if (subject_num >= 1 && subject_num <= 27) 
            if (subject_num >= invalid_num(1) && subject_num <= invalid_num(end))
                for i = 1:len % length of invalid_num 
                    if subject_num == invalid_num(i)
                        fprintf("\nSubject not found!\n\n");
                        bool = false; 
                    end
                end
            end
            if bool
                checker = false; % stop the while loop 
            end
            bool = true;
        else 
            fprintf("\nError! Enter a number between 1 to 27 (inclusive)!\n\n");
        end 
    end 

    id = "sub-" + int2str(subject_num); % target subject id 
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
    fprintf("\n<strong>Subject Info:</strong>\n");
    par = readtable("data/participants.tsv", "FileType","text", "Delimiter", "\t"); % load subject data
    disp(par(matches(par.participant_id, id), :)); % similar to the "find" function but comparing in tables 

    fprintf("\n<strong>Subject Settings:</strong>\n");
    fileName = fullfile("data", sprintf("sub-%d", subject_num), "eeg", sprintf("sub-%d_task-SemanticCategorization_eeg.json", subject_num));
    jsonData = jsondecode(fileread(fileName));
    disp(jsonData)
%% ____________________
end 