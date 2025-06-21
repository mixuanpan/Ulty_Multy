% Program Introduction 
consent = ip_welcome(); % asks for user consent to perform data analysis 

if consent
    invalid_num = [14 15 25]; % no subjects found 
    subject_num = ip_subject_info(invalid_num); % display user info with udf 
    EEG = ip_eeg_load(subject_num); % load the eeg data of the given subject
    
    fprintf("\n<strong>EEG Data Filtering Begins</strong>\n")
    [low, upper] = ip_bandpass_bounds(); % bandpass filter bounds from user input
    noise_num = ip_noise_num(); % the powerline to be removed
    filtered_data = ip_data_filter(EEG, low, upper, noise_num); % filter data 
    fprintf("\nEEG Data Filtering Successful\n");

    [channels_num, power, freqs1] = ip_time_frequency_analysis(filtered_data); % time frequency analysis for the user-given channel(s)
    labels = ip_brain_plot(filtered_data, subject_num); % view the relative location of each channel in a 3D interactive graph
    
    ip_final_display(invalid_num, subject_num, channels_num, noise_num, ...
        low, upper, freqs1, power, labels); % compare the data of the target subject to the entire subject pool in each channel
    fprintf("\nAnalysis Successful.\n\n");
else 
    fprintf("\nPermission Denied!\n");
    fprintf("\nAnalysis Unsuccessful.\n\n");
end