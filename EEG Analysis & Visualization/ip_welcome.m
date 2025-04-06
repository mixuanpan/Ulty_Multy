function consent = ip_welcome()
%% ____________________
%% INITIALIZATION
    fileName = "README"; % the name of the file to be displayed 
    dir = "data"; % file directory 
    filePath = fullfile(pwd, dir, fileName); % path to the file 
%% ____________________
%% CALCULATIONS
    if isfile(filePath) % check if the file exists 
        content = fileread(filePath); % read the file as a char array 
    else
        content = '';
        fprintf("\nFile not found!\n");
    end
%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS    
    fprintf("Welcome to the EEG Data Analysis Tool.\n")
    fprintf("This tool is designed to perform different analysis on the given data as follows: \n\n")
    disp(content);
%% ____________________
%% COMMAND WINDOW OUTPUT
    consent = input("Do you allow this tool to perform data analysis (y/n)? ", "s");
    if strcmp(lower(consent), 'y')
        fprintf("\nThank you for your permission!\n")
        fprintf("A series of analysis will be performed shortly.\n");
        consent = true;
    else 
        consent = false;
    end
%% ____________________
end