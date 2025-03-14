%% ____________________
%% INITIALIZATION
% Program Introduction 
consent = ip_welcome(); % asks for user consent to perform data analysis 

if consent
%% ____________________
%% CALCULATIONS
    par = readtable("data/participants.tsv", "FileType","text", "Delimiter", "\t"); % load subject data
    subject_num = ip_subject_info(par); % display user info with udf 
    [data, low, upper, noise_num] = ip_data_filter(subject_num); % filter data 
    [power, freqs1] = ip_time_frequency_analysis(data); % time frequency analysis for the user-given channel(s)
    ip_brain_plot(data, subject_num); % view the relative location of each channel in a 3D interactive graph
    ip_final_display(subject_num, low, upper, noise_num, freqs1, power); % compare the data of the target subject to the entire subject pool in each channel
    fprintf("\nAnalysis Successful.\n\n");
%% ____________________
%% OUTPUTS

else 
    fprintf("\nPermission Denied!\n");
    fprintf("\nAnalysis Unsuccessful.\n\n");
%% ____________________
end