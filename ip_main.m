%% ____________________
%% INITIALIZATION
% Program Introduction 
consent = ip_welcome(); % asks for user consent to perform data analysis 

if consent
%% ____________________
%% CALCULATIONS
    par = readtable("data/participants.tsv", "FileType","text", "Delimiter", "\t"); % load subject data
    subject_num = ip_subject_info(par); % display user info with udf 
    data = ip_data_filter(subject_num); % filter data 
    [power, freqs1] = ip_time_frequency_analysis(data); % time frequency analysis for the user-given channel(s)
    ip_brain_plot(data, subject_num); % view the relative location of each channel in a 3D interactive graph
    fprintf("\nAnalysis Successful.\n\n");
%% ____________________
%% OUTPUTS

else 
    fprintf("\nPermission Denied!\n");
    fprintf("\nAnalysis Unsuccessful.\n\n");
%% ____________________
end