# Ulty_Multy
An attempt to make brain-implantable chips for the good

# User Manual 

  Ulty Multy - EEG Data Analysis and Visualization     html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td{margin:0;padding:0;border:0;outline:0;font-size:100%;vertical-align:baseline;background:transparent}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}:focus{outine:0}ins{text-decoration:none}del{text-decoration:line-through}table{border-collapse:collapse;border-spacing:0} html { min-height:100%; margin-bottom:1px; } html body { height:100%; margin:0px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#000; line-height:140%; background:#fff none; overflow-y:scroll; } html body td { vertical-align:top; text-align:left; } h1 { padding:0px; margin:0px 0px 25px; font-family:Arial, Helvetica, sans-serif; font-size:1.5em; color:#d55000; line-height:100%; font-weight:normal; } h2 { padding:0px; margin:0px 0px 8px; font-family:Arial, Helvetica, sans-serif; font-size:1.2em; color:#000; font-weight:bold; line-height:140%; border-bottom:1px solid #d6d4d4; display:block; } h3 { padding:0px; margin:0px 0px 5px; font-family:Arial, Helvetica, sans-serif; font-size:1.1em; color:#000; font-weight:bold; line-height:140%; } a { color:#005fce; text-decoration:none; } a:hover { color:#005fce; text-decoration:underline; } a:visited { color:#004aa0; text-decoration:none; } p { padding:0px; margin:0px 0px 20px; } img { padding:0px; margin:0px 0px 20px; border:none; } p img, pre img, tt img, li img, h1 img, h2 img { margin-bottom:0px; } ul { padding:0px; margin:0px 0px 20px 23px; list-style:square; } ul li { padding:0px; margin:0px 0px 7px 0px; } ul li ul { padding:5px 0px 0px; margin:0px 0px 7px 23px; } ul li ol li { list-style:decimal; } ol { padding:0px; margin:0px 0px 20px 0px; list-style:decimal; } ol li { padding:0px; margin:0px 0px 7px 23px; list-style-type:decimal; } ol li ol { padding:5px 0px 0px; margin:0px 0px 7px 0px; } ol li ol li { list-style-type:lower-alpha; } ol li ul { padding-top:7px; } ol li ul li { list-style:square; } .content { font-size:1.2em; line-height:140%; padding: 20px; } pre, code { font-size:12px; } tt { font-size: 1.2em; } pre { margin:0px 0px 20px; } pre.codeinput { padding:10px; border:1px solid #d3d3d3; background:#f7f7f7; } pre.codeoutput { padding:10px 11px; margin:0px 0px 20px; color:#4c4c4c; } pre.error { color:red; } @media print { pre.codeinput, pre.codeoutput { word-wrap:break-word; width:100%; } } span.keyword { color:#0000FF } span.comment { color:#228B22 } span.string { color:#A020F0 } span.untermstring { color:#B20000 } span.syscmd { color:#B28C00 } span.typesection { color:#A0522D } .footer { width:auto; padding:10px 0px; margin:25px 0px 0px; border-top:1px dotted #878787; font-size:0.8em; line-height:140%; font-style:italic; color:#878787; text-align:left; float:none; } .footer p { margin:0px; } .footer a { color:#878787; } .footer a:hover { color:#878787; text-decoration:underline; } .footer a:visited { color:#878787; } table th { padding:7px 5px; text-align:left; vertical-align:middle; border: 1px solid #d6d4d4; font-weight:bold; } table td { padding:7px 5px; text-align:left; vertical-align:top; border:1px solid #d6d4d4; }

Ulty Multy - EEG Data Analysis and Visualization
================================================

Welcome to the tutorial of Ulty Multy !

This project utilizes the open data from OpenNeuro to analyze and visualize EEG data.

Contents
--------

*   [Foreword](#1)
*   [Main Script](#2)
*   [Welcome Function](#3)
*   [Subject Number & Info Function](#4)
*   [Data Filtering Function](#5)
*   [Time Frequency Analysis Function](#6)
*   [3D Brain Plot Function](#7)
*   [Final Display Function](#8)

Foreword
--------

After

Main Script
-----------

This is the file to run to start the program

```
% asks for user consent to perform data analysis
consent = ip\_welcome();
```

% When Consent is given
if consent
    % load subject data
    par = readtable("data/participants.tsv", "FileType","text", "Delimiter", "\\t");

    % display user info
    subject\_num = ip\_subject\_info(par);

    % filter data
    \[data, low, upper, noise\_num\] = ip\_data\_filter(subject\_num);

    % perform time frequency analysis and visualize the user-selected
    % channel(s)
    \[power, freqs1\] = ip\_time\_frequency\_analysis(data);

    % view the relative location of each channel in a 3D interactive graph
    ip\_brain\_plot(data, subject\_num);

    % compare the data of the target subject to the entire subject pool in
    % each channel
    ip\_final\_display(subject\_num, low, upper, noise\_num, freqs1, power);
    fprintf("\\nAnalysis Successful.\\n\\n");

% When consent is not given
else
    fprintf("\\nPermission Denied!\\n");
    fprintf("\\nAnalysis Unsuccessful.\\n\\n");
end

Welcome Function
----------------

This function begins with a welcome message explaining the data collection process, providing users with background information to help interpret the analysis results. The program then asks for consent to analyze the user’s local data. If consent is denied, the program ends without performing any analysis. While the open data used for this project is stored locally, requesting consent is essential when handling real user data in future applications.

function consent = ip\_welcome()
    % INITIALIZATION
    fileName = "README"; % the name of the file to be displayed
    dir = "data"; % file directory
    filePath = fullfile(pwd, dir, fileName); % path to the file

    % check if the file exists
    if isfile(filePath)
        content = fileread(filePath); % read the file as a char array
    else
        content = '';
        fprintf("\\nFile not found!\\n");
    end

    % Printed Output
    fprintf("Welcome to the EEG Data Analysis Tool.\\n")
    fprintf("This tool is designed to perform different analysis on the given data as follows: \\n\\n")
    disp(content); % Data Collection Process

    % Ask for user's consent
    consent = input("Do you allow this tool to perform data analysis (y/n)? ", "s");
    if strcmp(lower(consent), 'y')
        fprintf("\\nThank you for your permission!\\n")
        fprintf("A series of analysis will be performed shortly.\\n");
        consent = true;
    else
        consent = false;
    end
end

Welcome to the EEG Data Analysis Tool.
This tool is designed to perform different analysis on the given data as follows: 

Data collection took place at the NeuroCognition Laboratory (NCL) in San Diego, California under the supervision of Dr. Phillip Holcomb. 
This project followed the San Diego State University’s IRB guidelines. 

Participants sat in a comfortable chair in a darkened sound attenuated room throughout the experiment. 
They were given a gamepad for button pressing. 
They were instructed to watch the LCD video monitor that was at a viewing distance of 150cm. 

Participants were presented with 300 prime-target pairs. 
All targets were four-letter English words. 
Of the 300 critical trials, 100 had English word primes, 100 had ASL sign primes, and 100 had fingerspelled word primes. 
Half of the primes in each condition were related to the targets. 
Related English word primes were identity primes to the English word, related fingerspelled word primes were also identity primes, and related ASL primes were ASL translations of the English word targets. 
The other half of the primes were unrelated to the targets.

Participants were instructed to focus on the purple fixation cross that appeared on the screen for 800ms. 
This fixation cross then turned white for 500ms. 
Then, one of three prime conditions was presented: an English word, an ASL sign, or a fingerspelled word. 
English prime words were presented for 300ms. 
Signed (M = 565ms) and fingerspelled (M = 1173ms) video primes had variable durations. 
All target stimuli were 4-letter English words presented for 500ms. 
Related primes were either identity or translations.

Press any of the 4 buttons on the right of the gamepad whenever you see an animal. 
It doesn’t matter if the animal is presented as a sign, a word, or fingerspelled. 
Press for ANY animal. You can blink whenever you see purple. A purple + means you have time for a quick blink. 
A purple (--) means you can blink as much as you want.

Error using input
Cannot call INPUT from EVALC.

Error in commenting\_all>ip\_welcome (line 75)
    consent = input("Do you allow this tool to perform data analysis (y/n)? ", "s");
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error in commenting\_all (line 15)
consent = ip\_welcome(); 
          ^^^^^^^^^^^^

Subject Number & Info Function
------------------------------

This function prompts the user to select a target subject (between 1 and 27) for analysis. If the input is invalid or out of range, the program will continue asking until a valid input is provided. The function then reads a .tsv file to display the selected subject’s demographics and data collection settings. This helps the user identify potential influencing factors when comparing data across subjects.

function subject\_num = ip\_subject\_info(par)

    % INITIALIZATION
    invalid\_num = \[14 15 25\]; % no subjects found
    len = length(invalid\_num); % number of invalid numbers
    checker = true; % while loop control variable
    bool = true; % loop control variable

    % subject\_num error check
    while checker
        % ask for subject number from user input
        subject\_num = input("Which subject are you looking for? Enter a number between 1 and 27 (inclusive) --> ");

        % When the subject number is in the given range
        if (subject\_num >= 1 && subject\_num <= 27)
            for i = 1:len % length of invalid\_num
                if subject\_num == invalid\_num(i)
                    fprintf("\\nSubject not found!\\n\\n");
                    bool = false;
                end
            end
            if bool
                checker = false; % stop the while loop
            end
            bool = true;

        % When the subject number is out of range
        else
            fprintf("\\nError! Enter a number between 1 to 27 (inclusive)!\\n\\n");
        end
    end

    % target subject ID
    id = "sub-" + int2str(subject\_num);

    % print out subject info
    fprintf("\\n<strong>Subject Info:</strong>\\n");

    % match: similar to the "find" function but comparing in tables
    disp(par(matches(par.participant\_id, id), :));

    % print out subject settings
    fprintf("\\n<strong>Subject Settings:</strong>\\n");
    fileName = fullfile("data", sprintf("sub-%d", subject\_num), "eeg", sprintf("sub-%d\_task-SemanticCategorization\_eeg.json", subject\_num));
    jsonData = jsondecode(fileread(fileName));
    disp(jsonData);
end

Data Filtering Function
-----------------------

This function includes bandpass filtering and notch filtering, both of which help reduce noise and improve signal clarity in the EEG data.

Bandpass filtering isolates signals within a specific frequency range, removing frequencies outside of this range to focus on meaningful brain activity. The user is prompted to input lower and upper bounds between 0.1 Hz and 40 Hz — the typical range for EEG analysis, as it captures key brainwave patterns such as delta, theta, alpha, beta, and gamma waves. If the user inputs values outside this range or sets the upper bound lower than the lower bound, the program triggers an error and asks for valid inputs. Once the program receives valid values, it uses the pop\_eegfiltnew() function to apply the bandpass filter, preserving only the signals within the chosen frequency band. For instance, setting the range to 1–30 Hz would eliminate low-frequency drifts and high-frequency noise, making brainwave patterns more discernible.

Notch filtering, on the other hand, targets narrow-band interference, such as powerline noise, which typically occurs at 50 Hz (in most countries) or 60 Hz (in North America). The user can select either 50 Hz or 60 Hz for the notch filter, and the program will apply it to remove the constant-frequency interference that often appears as spikes in EEG data. Removing powerline noise helps uncover subtle patterns in brain activity that might otherwise be masked by electrical interference. By applying both bandpass and notch filtering, the program ensures that the processed EEG data is cleaner and more suitable for accurate time- frequency analysis.

function \[data, low, upper, noise\_num\] = ip\_data\_filter(subject\_num)

    fprintf("\\n<strong>EEG Data Filtering Begins</strong>\\n");
    currentPath = "/Users/mixuan/Desktop/Ulty\_Multy"; % current directory

    % the file for reading EEG data
    fileName = "sub-" + int2str(subject\_num) + "\_task-SemanticCategorization\_eeg.set";

    % the path for the EEG data file
    filePath = fullfile(currentPath, "data", "sub-" + int2str(subject\_num), "eeg");

    cd(filePath); % change to file directory

    % load eeg data list from the data of user-chosen subject
    % use char() to avoid '.set' being truncated
    EEG = pop\_loadset(char(fileName));

    cd(currentPath); % change to working directory
    checker = true; % while loop control variable
    checker2 = true; % another loop control variable
    low = 0; % initialize the lower bound
    upper = 0; % initialize the upper bound
    noise\_num = 0; % initialize the powerline to be removed

    % bandpass filter bounds from user input
    while checker
        indicator = input("Do you want to bandpass filter (y/n)? ", 's');

        % When the user wants a bandpass filter
        if strcmp(lower(indicator), "y")

            % ask for lower bound input
            while checker2
                low = input("Enter the lower bound in Hz: ");
                if low < 0.1
                    fprintf("Entered lower bound is too small!\\n")
                    fprintf("Please enter a positive number greater or equal to 0.1 Hz!\\n")
                else
                    checker2 = false;
                end
            end

            % ask for upper bound input
            checker2 = true;
            while checker2
                upper = input("Enter the upper bound in Hz: ");
                if upper > 40
                    fprintf("Entered upper bound is too high!\\n")
                    fprintf("Please enter a positive number smaller than 40 Hz!\\n")
                elseif upper < low
                    fprintf("Entered upper bound is too low!\\n")
                    fprintf("Upper bound must be higher than lower bound!\\n")
                else
                    checker2 = false;
                end
            end

            % Bandpass filter in the desired Hz range
            EEG = pop\_eegfiltnew(EEG, low, upper);

            checker = false;
        % When the user doesn't want a bandpass filter
        elseif strcmp(lower(indicator), "n")
            checker = false;
        end
    end

    % noise removal
    checker = true;
    while checker
        indicator = input("Do you want to remove a specific powerline (y/n)? ", 's');

        % When the user wants a noise removal
        if strcmp(lower(indicator), 'y')
            noise\_num = menu("Enter the notch filter to be filtered out", "50 Hz (common in Europe and most countries)", "60 Hz (common in North America)");

            % convert 1, 2 (index) to 50, 60 (notch filter)
            noise\_num = 40 + 10 \* noise\_num;

            % notch filtering
            EEG = pop\_eegfiltnew(EEG, noise\_num - 1, noise\_num + 1, \[\], 1);
            checker = false;

        % When the user doesn't want a noise removal
        elseif strcmp(lower(indicator), 'n')
            checker = false;

        % When the user falsely indicates if they want a noise removal or
        % not, the program skips the noise removal processing
        else
            fprintf("Please enter either 'y' or 'n'\\n");
        end
    end

    % function output
    data = EEG;
    fprintf("\\nEEG Data Filtering Successful\\n");
end

Time Frequency Analysis Function
--------------------------------

After filtering, the program automatically conducts a time-frequency analysis using FFT with Hanning window tapering. It adjusts the frequency range to match FFT output (1 Hz to 60 Hz) and generates 200 time points. This process is repeated 32 times — once for each channel — producing 30,934 estimated frequencies.

The function generates a heat map to visualize how the power of different frequency components changes over time for each EEG channel. The user can select any of the 32 channels for display, and the program will create a heat map using the imagesc() function. In the heat map, the x-axis represents time, the y-axis represents frequency, and the color intensity indicates the magnitude of power at each time-frequency point. Warmer colors, such as red and yellow, reflect higher power, while cooler colors, like blue and green, indicate lower power. In this example, the user chooses channel 21, 7, 1, and 32 to visualize.

function \[power, freqs\] = ip\_time\_frequency\_analysis(input\_data)

    % inform the user of the analysis type
    fprintf("\\n<strong>Time Frequency Analysis</strong>\\n");

    EEG = input\_data;
    channels\_num = size(EEG.data, 1); % number of channels

    % cell arrays contain elements with different types
    power = cell(1, channels\_num); % a cell array to store power

    freqs = \[\]; % frequency initialization
    checker = true; % loop control variable

% Wavelet Decomposition for each (typically 32) channel
    for ch = 1:channels\_num
        \[power{ch}, freqs\] = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', \[1, 60\]);
    end

% Power Spectrum for individual channels
    while checker
        checker2 = true; % loop control variable
        while checker2
            channel = input("\\n\\nWhich channel would you like to visualize? ");
            if ~isnumeric(channel)
                fprintf("\\nPlease enter a numeric value!\\n");
            elseif isnumeric(channel) & (channel < 1 | channel > channels\_num)
                fprintf("\\nPlease enter a number between 1 and %i!\\n", channels\_num);
            else
                checker2 = false;
            end
        end

        % Plotting
        figure;
        imagesc(\[\], freqs, abs(power{channel})); % plot power magnitude
        xlabel("Time (ms)");
        ylabel("Frequency (Hz)");
        title(\["Time-Frequency Representation: Channel ", num2str(channel)\]);
        colorbar;

        % wait until the figure is closed by the user
        waitfor(gcf);

        % Plot another channel
        checker2 = input("Do you want to visualize another channel (y/n)? ", "s");
        if strcmp(lower(checker2), "n")
            checker = false;
        elseif ~strcmp(lower(checker2), "y")
            fprintf("\\nInput Error!!\\n\\n");
            checker = false;
        end
    end
    fprintf("\\nTime Frequency Analysis and Visualization Successful.\\n");
end

3D Brain Plot Function
----------------------

This function creates a 3D interactive brain plot where the user can rotate, zoom, and explore the brain's surface. Highlighted channels are shown in red, making it easy to track their position. The interactive nature allows the user to inspect different angles and better understand the spatial relationship between channels. This feature enhances data interpretation by providing a clear, dynamic view of brain activity distribution.

function ip\_brain\_plot(data, subject\_num)

    % INITIALIZATION
    EEG = data; % EEG data from user input
    chanlocs = EEG.chanlocs; % extract channel locations
    checker = true; % loop control variable

    % extract the channels for the given subject number from the file
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d\_task-SemanticCategorization\_channels.tsv", subject\_num, subject\_num), "FileType", "text", "Delimiter", "\\t");

    % extract the name column of the channels to show in the final 3D graph
    labels = channels.name;

    fprintf("\\n<strong>Brain Plotting Begins</strong>\\n");

    % ask the user if they want to highlight a specific channel
    while checker
        indicator = input("Do you want to highlight a specific channel (y/n)? ", "s");
        if strcmp(lower(indicator), "n")
            checker = false;
        elseif strcmp(lower(indicator), "y")
            checker = false;
            highlight = menu("Choose the channel name that you want it to be highlighted.", labels);
        else
            fprintf("Please enter 'y' or 'n'!\\n");
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
    % since brain is not a sphere, we need the relative scale of X, Y, & Z
    % axis equal; -> This makes the 3 axes equal

    grid on;

    % wait until the graph is closed to proceed to the final display
    waitfor(gcf);
end

Final Display Function
----------------------

This function compares the selected subject’s data with other subjects’ data. The selected subject’s data is displayed in transparent red, while the compared subject’s data appears in gray. Overlapping areas are shown in darker red, highlighting similarities between the two datasets. This comparison is performed channel by channel, helping to identify consistent patterns and variations across individuals. To improve efficiency and avoid excessive loading time, the program saves the comparison plots directly to a folder instead of displaying them.

function ip\_final\_display(subject\_num, low, upper, noise\_num, freqs, power\_spec)
    % compare the target to all of the subjects
    % Data Packaging

    % Initialization
    fprintf("\\n<strong>Final Analysis Results:</strong>\\n\\n");
    subject\_count = 27; % There are a total of 27 subjects with 3 missing data
    invalid\_num = \[14 15 25\]; % no subjects found
    current\_subject = 1; % subjects to iterate through, starting from 1
    currentPath = "/Users/mixuan/Desktop/Ulty\_Multy"; % data directory
    resultsPath = "/Users/mixuan/Desktop/Ulty\_Multy/Results"; % results directory
    channels\_num = 32; % number of channels in the given data

    % ip\_brain\_plot.m
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d\_task-SemanticCategorization\_channels.tsv", subject\_num, subject\_num), "FileType", "text", "Delimiter", "\\t");
    labels = channels.name;
    % names of the 32 channels

    % iterate through each subject to analyze and get the data
    while current\_subject <= subject\_count
        % ip\_subject\_info.m
        % check if the current subject is the target subject
        current\_subject = current\_subject + (current\_subject == subject\_num) \* (current\_subject < subject\_count);
        % check if the subject number is invalid
        if current\_subject >= invalid\_num(1) && current\_subject <= invalid\_num(end)
            for i = 1:length(invalid\_num)
                current\_subject = current\_subject + (current\_subject == invalid\_num(i));
            end
        end

        % ip\_data\_filter
        % filter each subject data with the bandwith given to the target
        % subject
        fileName = "sub-" + int2str(current\_subject) + "\_task-SemanticCategorization\_eeg.set"; % the file for reading EEG data
        filePath = fullfile(currentPath, "data", "sub-" + int2str(current\_subject), "eeg"); % the path for the EEG data file
        cd(filePath); % change to file directory
        EEG = pop\_loadset(char(fileName)); % load eeg data list from the current subject
        cd(currentPath) % back to script directory
        % bandpass filter
        if low ~= 0 && upper ~= 0
            % both "low ~= 0" and "upper ~= 0" are numeric scales ->
            % use && instead of & for performance
            EEG = pop\_eegfiltnew(EEG, low, upper); % Bandpass filter in the desired Hz range
        end
        % noise removal
        if noise\_num ~= 0
            EEG = pop\_eegfiltnew(EEG, noise\_num - 1, noise\_num + 1, \[\], 1); % notch filter
        end

        % ip\_time\_frequency\_analysis.m
        fig = figure("Visible", "off"); % Set the figure to be invisible
        layout = tiledlayout(4, 8, 'Padding', 'compact', 'TileSpacing', 'compact'); % % 4 rows, 8 columns for 32 subplots
        for ch = 1:channels\_num
            % Wavelet Decomposition for each channel
            power\_data = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', \[1, 60\]); % power data for this specific channel
            % only need the power data, neglecting the frequency
            nexttile;
            plot(freqs, abs(power\_data), 'Color', \[0.7, 0.7, 0.7, 0.03\]); % Compared subject data in gray
            hold on; % stay on the same figure
            plot(freqs, abs(power\_spec{ch}), 'Color', \[1, 0, 0, 0.006\], "LineWidth", 1.5); % Target subject data in red
            title(sprintf("%s", labels{ch}), "FontWeight", "bold", 'Units', 'normalized', 'Position', \[1, 1, 1\]); % Channel name for each subplot
        end

        % Graph formatting for all subplots
        xlabel(layout, "Frequency (Hz)", "FontWeight", "bold"); % overall y label
        ylabel(layout, "Power (VA)", "FontWeight", "bold"); % overall x label
        title(layout, sprintf("Subject %i - Gray vs. Target Subject - Red (%i)", current\_subject, subject\_num)); % overall title

        saveas(fig, fullfile(resultsPath, sprintf("output\_%i.png", current\_subject))); % save the graph file
        close(fig); % close the current figure

        fprintf("\\n<strong>Final display progress: subject %i</strong>\\n\\n", current\_subject);
        current\_subject = current\_subject + 1; % change to the next subject
    end

end

  
[Published with MATLAB® R2024b](https://www.mathworks.com/products/matlab/)

# Dataset

OpenNeuro Dataset ds005565 (Neural associations between fingerspelling, print, and signs: An ERP priming study with deaf readers)
 
https://openneuro.org/datasets/ds005565/versions/1.0.3/download

Brittany Lee and Sofia E. Ortega and Priscilla M. Martinez and Katherine J. Midgley and Phillip J. Holcomb and Karen Emmorey (2024). Neural associations between fingerspelling, print, and signs: An ERP priming study with deaf readers. OpenNeuro. [Dataset] doi: doi:10.18112/openneuro.ds005565.v1.0.3 


# References 

3D Image Segmentation of Brain Tumors Using Deep Learning. Directed by MathWorks, 2019, https://arc.net/l/quote/ckrwzgql.

Aaron J Newman. Time and Frequency Domains. https://neuraldatascience.io/7-eeg/time_freq.html#time-and-frequency-domains.

Alex Teghipco. Brain Surfer. https://github.com/alexteghipco/brainSurfer.

Arnaud Delorme and Scott Makeig. EEGLAB. https://eeglab.org/.
---. EEGLAB Tutorial. 2003, https://sccn.ucsd.edu/eeglab/download/eeglabtutorial4.2.pdf.

Brittany Lee, et al. Neural Associations between Fingerspelling, Print, and Signs: An ERP Priming Study with Deaf Readers. https://github.com/OpenNeuroDatasets/ds005565, 17 Oct. 2024, https://doi.org/doi:10.18112/openneuro.ds005565.v1.0.3.

EEG Analysis in MATLAB Using EEGLAB and Brainstorm. Directed by Younes Sadat-Nejad, 2020, https://www.youtube.com/watch?v=Rl7ELFwh5qw&t=200s.

François Tadel, et al. Brainstorm: A MATLAB Based, Open-Source Application for Advanced MEG/EEG Data Processing and Visualization. MathWorks, 2015, https://arc.net/l/quote/mimpdlju.

Günter Edlinger and Christoph Guger. EEG Data Processing and Classification with g.BSanalyze Under MATLAB. MathWorks, 2002, https://www.mathworks.com/company/technical-articles/eeg-data-processing-and-classification-with-gbsanalyze-under-matlab.html.

John Ashburner, et al. SPM12 Manual. Functional Imaging Laboratory, Wellcome Centre for Human Neuroimaging, UCL Queen Square Institute of Neurology, 2021, https://www.fil.ion.ucl.ac.uk/spm/doc/spm12_manual.pdf.

Makoto’s Useful EEGLAB Code. https://sccn.ucsd.edu/wiki/Makoto%27s_useful_EEGLAB_code#How_to_load_EEGLAB_.set_and_.fdt_files_without_using_EEGLAB_.2805.2F09.2F2020_updated.29.

Pedro Silva. Creating .Txt File with Matlab. 22 May 2012, https://arc.net/l/quote/mfzdcxbs.

Wojciech Zaremba. Pop_loadset. 6 June 2013, https://github.com/wojzaremba/active-delays/blob/master/external_tools/eeglab11_0_4_3b/functions/popfunc/pop_loadset.m.

Xu Cui. Brain Surface Plot with MatLab. May 2010, https://arc.net/l/quote/xlnucjda.

Younes Sadat-Nejad and Soosan Beheshti. Efficient Blinking Component Estimation in Subspace-Based EEG and MEG Analysis. Institute of Electrical and Electronics Engineers (IEEE), 2019, https://doi.org/10.1109/IEEECONF44664.2019.9048870.
---. Higher Resolution sLORETA (HR-sLORETA) in EEG Source Imaging. Institute of Electrical and Electronics Engineers (IEEE), 2019, https://doi.org/10.1109/EMBC.2019.8856905.


For more information, please visit [Ulty Multy Zotero Library](https://www.zotero.org/groups/5912754/ulty_multy/library)
