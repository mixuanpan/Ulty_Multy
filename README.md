# Ulty_Multy
An attempt to make brain-implantable chips for the good

# User Manual 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--
This HTML was auto-generated from MATLAB code.
To make changes, update the MATLAB code and republish this document.
      -->
<title>Ulty Multy - EEG Data Analysis and Visualization</title>
<meta name="generator" content="MATLAB 24.2">
<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/">
<meta name="DC.date" content="2025-03-18">
<meta name="DC.source" content="commenting_all.m">
<style type="text/css">
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td{margin:0;padding:0;border:0;outline:0;font-size:100%;vertical-align:baseline;background:transparent}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}:focus{outine:0}ins{text-decoration:none}del{text-decoration:line-through}table{border-collapse:collapse;border-spacing:0}

html { min-height:100%; margin-bottom:1px; }
html body { height:100%; margin:0px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#000; line-height:140%; background:#fff none; overflow-y:scroll; }
html body td { vertical-align:top; text-align:left; }

h1 { padding:0px; margin:0px 0px 25px; font-family:Arial, Helvetica, sans-serif; font-size:1.5em; color:#d55000; line-height:100%; font-weight:normal; }
h2 { padding:0px; margin:0px 0px 8px; font-family:Arial, Helvetica, sans-serif; font-size:1.2em; color:#000; font-weight:bold; line-height:140%; border-bottom:1px solid #d6d4d4; display:block; }
h3 { padding:0px; margin:0px 0px 5px; font-family:Arial, Helvetica, sans-serif; font-size:1.1em; color:#000; font-weight:bold; line-height:140%; }

a { color:#005fce; text-decoration:none; }
a:hover { color:#005fce; text-decoration:underline; }
a:visited { color:#004aa0; text-decoration:none; }

p { padding:0px; margin:0px 0px 20px; }
img { padding:0px; margin:0px 0px 20px; border:none; }
p img, pre img, tt img, li img, h1 img, h2 img { margin-bottom:0px; }

ul { padding:0px; margin:0px 0px 20px 23px; list-style:square; }
ul li { padding:0px; margin:0px 0px 7px 0px; }
ul li ul { padding:5px 0px 0px; margin:0px 0px 7px 23px; }
ul li ol li { list-style:decimal; }
ol { padding:0px; margin:0px 0px 20px 0px; list-style:decimal; }
ol li { padding:0px; margin:0px 0px 7px 23px; list-style-type:decimal; }
ol li ol { padding:5px 0px 0px; margin:0px 0px 7px 0px; }
ol li ol li { list-style-type:lower-alpha; }
ol li ul { padding-top:7px; }
ol li ul li { list-style:square; }

.content { font-size:1.2em; line-height:140%; padding: 20px; }

pre, code { font-size:12px; }
tt { font-size: 1.2em; }
pre { margin:0px 0px 20px; }
pre.codeinput { padding:10px; border:1px solid #d3d3d3; background:#f7f7f7; }
pre.codeoutput { padding:10px 11px; margin:0px 0px 20px; color:#4c4c4c; }
pre.error { color:red; }

@media print { pre.codeinput, pre.codeoutput { word-wrap:break-word; width:100%; } }

span.keyword { color:#0000FF }
span.comment { color:#228B22 }
span.string { color:#A020F0 }
span.untermstring { color:#B20000 }
span.syscmd { color:#B28C00 }
span.typesection { color:#A0522D }

.footer { width:auto; padding:10px 0px; margin:25px 0px 0px; border-top:1px dotted #878787; font-size:0.8em; line-height:140%; font-style:italic; color:#878787; text-align:left; float:none; }
.footer p { margin:0px; }
.footer a { color:#878787; }
.footer a:hover { color:#878787; text-decoration:underline; }
.footer a:visited { color:#878787; }

table th { padding:7px 5px; text-align:left; vertical-align:middle; border: 1px solid #d6d4d4; font-weight:bold; }
table td { padding:7px 5px; text-align:left; vertical-align:top; border:1px solid #d6d4d4; }





  </style>
</head>
<body>
<div class="content">
<h1>Ulty Multy - EEG Data Analysis and Visualization</h1>
<!--introduction-->
<p>Welcome to the tutorial of Ulty Multy !</p>
<p>This project utilizes the open data from OpenNeuro to analyze and visualize EEG data.</p>
<!--/introduction-->
<h2>Contents</h2>
<div>
<ul>
<li>
<a href="#1">Foreword</a>
</li>
<li>
<a href="#2">Main Script</a>
</li>
<li>
<a href="#3">Welcome Function</a>
</li>
<li>
<a href="#4">Subject Number &amp; Info Function</a>
</li>
<li>
<a href="#5">Data Filtering Function</a>
</li>
<li>
<a href="#6">Time Frequency Analysis Function</a>
</li>
<li>
<a href="#8"></a>
</li>
<li>
<a href="#9">INITIALIZATION</a>
</li>
<li>
<a href="#10"></a>
</li>
<li>
<a href="#11">CALCULATIONS</a>
</li>
<li>
<a href="#12"></a>
</li>
<li>
<a href="#13">FORMATTED TEXT &amp; FIGURE DISPLAYS</a>
</li>
<li>
<a href="#14"></a>
</li>
<li>
<a href="#17">Initialization</a>
</li>
<li>
<a href="#18">ip_brain_plot.m</a>
</li>
<li>
<a href="#19">ip_subject_info.m</a>
</li>
<li>
<a href="#20">ip_data_filter</a>
</li>
<li>
<a href="#21">ip_time_frequency_analysis.m</a>
</li>
</ul>
</div>
<h2 id="1">Foreword</h2>
<p>After</p>
<h2 id="2">Main Script</h2>
<p>This is the file to run to start the program</p>
<pre class="codeinput"><span class="comment">% asks for user consent to perform data analysis</span>
consent = ip_welcome();
<span class="comment">%</span>
<span class="comment">% When Consent is given</span>
<span class="comment">%</span>
<span class="keyword">if</span> consent

    <span class="comment">% load subject data</span>

    par = readtable(<span class="string">"data/participants.tsv"</span>, <span class="string">"FileType"</span>,<span class="string">"text"</span>, <span class="string">"Delimiter"</span>, <span class="string">"\t"</span>);

    <span class="comment">% display user info</span>
    subject_num = ip_subject_info(par);

    <span class="comment">% filter data</span>
    [data, low, upper, noise_num] = ip_data_filter(subject_num);

    <span class="comment">% perform time frequency analysis and visualize the user-selected</span>
    <span class="comment">% channel(s)</span>
    [power, freqs1] = ip_time_frequency_analysis(data);

    <span class="comment">% view the relative location of each channel in a 3D interactive graph</span>
    ip_brain_plot(data, subject_num);

    <span class="comment">% compare the data of the target subject to the entire subject pool in</span>
    <span class="comment">% each channel</span>
    ip_final_display(subject_num, low, upper, noise_num, freqs1, power);
    fprintf(<span class="string">"\nAnalysis Successful.\n\n"</span>);

<span class="comment">% When consent is not given</span>
<span class="keyword">else</span>
    fprintf(<span class="string">"\nPermission Denied!\n"</span>);
    fprintf(<span class="string">"\nAnalysis Unsuccessful.\n\n"</span>);
<span class="keyword">end</span>
</pre>
<h2 id="3">Welcome Function</h2>
<p>This function begins with a welcome message explaining the data collection process, providing users with background information to help interpret the analysis results. The program then asks for consent to analyze the user’s local data. If consent is denied, the program ends without performing any analysis. While the open data used for this project is stored locally, requesting consent is essential when handling real user data in future applications.</p>
<pre class="codeinput"><span class="keyword">function</span> consent = ip_welcome()
    <span class="comment">% INITIALIZATION</span>
    fileName = <span class="string">"README"</span>; <span class="comment">% the name of the file to be displayed</span>
    dir = <span class="string">"data"</span>; <span class="comment">% file directory</span>
    filePath = fullfile(pwd, dir, fileName); <span class="comment">% path to the file</span>

    <span class="comment">% check if the file exists</span>
    <span class="keyword">if</span> isfile(filePath)
        content = fileread(filePath); <span class="comment">% read the file as a char array</span>
    <span class="keyword">else</span>
        content = <span class="string">''</span>;
        fprintf(<span class="string">"\nFile not found!\n"</span>);
    <span class="keyword">end</span>

    <span class="comment">% Printed Output</span>
    fprintf(<span class="string">"Welcome to the EEG Data Analysis Tool.\n"</span>)
    fprintf(<span class="string">"This tool is designed to perform different analysis on the given data as follows: \n\n"</span>)
    disp(content); <span class="comment">% Data Collection Process</span>

    <span class="comment">% Ask for user's consent</span>
    consent = input(<span class="string">"Do you allow this tool to perform data analysis (y/n)? "</span>, <span class="string">"s"</span>);
    <span class="keyword">if</span> strcmp(lower(consent), <span class="string">'y'</span>)
        fprintf(<span class="string">"\nThank you for your permission!\n"</span>)
        fprintf(<span class="string">"A series of analysis will be performed shortly.\n"</span>);
        consent = true;
    <span class="keyword">else</span>
        consent = false;
    <span class="keyword">end</span>
<span class="keyword">end</span>
</pre>
<pre class="codeoutput">Welcome to the EEG Data Analysis Tool.
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

</pre>
<pre class="codeoutput error">Error using input
Cannot call INPUT from EVALC.

Error in commenting_all&gt;ip_welcome (line 78)
    consent = input("Do you allow this tool to perform data analysis (y/n)? ", "s");
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error in commenting_all (line 15)
consent = ip_welcome(); 
          ^^^^^^^^^^^^</pre>
<h2 id="4">Subject Number &amp; Info Function</h2>
<p>This function prompts the user to select a target subject (between 1 and 27) for analysis. If the input is invalid or out of range, the program will continue asking until a valid input is provided. The function then reads a .tsv file to display the selected subject’s demographics and data collection settings. This helps the user identify potential influencing factors when comparing data across subjects.</p>
<pre class="codeinput"><span class="keyword">function</span> subject_num = ip_subject_info(par)

    <span class="comment">% INITIALIZATION</span>
    invalid_num = [14 15 25]; <span class="comment">% no subjects found</span>
    len = length(invalid_num); <span class="comment">% number of invalid numbers</span>
    checker = true; <span class="comment">% while loop control variable</span>
    bool = true; <span class="comment">% loop control variable</span>

    <span class="comment">% subject_num error check</span>
    <span class="keyword">while</span> checker
        <span class="comment">% ask for subject number from user input</span>
        subject_num = input(<span class="string">"Which subject are you looking for? Enter a number between 1 and 27 (inclusive) --&gt; "</span>);

        <span class="comment">% When the subject number is in the given range</span>
        <span class="keyword">if</span> (subject_num &gt;= 1 &amp;&amp; subject_num &lt;= 27)
            <span class="keyword">for</span> i = 1:len <span class="comment">% length of invalid_num</span>
                <span class="keyword">if</span> subject_num == invalid_num(i)
                    fprintf(<span class="string">"\nSubject not found!\n\n"</span>);
                    bool = false;
                <span class="keyword">end</span>
            <span class="keyword">end</span>
            <span class="keyword">if</span> bool
                checker = false; <span class="comment">% stop the while loop</span>
            <span class="keyword">end</span>
            bool = true;

        <span class="comment">% When the subject number is out of range</span>
        <span class="keyword">else</span>
            fprintf(<span class="string">"\nError! Enter a number between 1 to 27 (inclusive)!\n\n"</span>);
        <span class="keyword">end</span>
    <span class="keyword">end</span>

    <span class="comment">% target subject ID</span>
    id = <span class="string">"sub-"</span> + int2str(subject_num);

    <span class="comment">% print out subject info</span>
    fprintf(<span class="string">"\n&lt;strong&gt;Subject Info:&lt;/strong&gt;\n"</span>);

    <span class="comment">% match: similar to the "find" function but comparing in tables</span>
    disp(par(matches(par.participant_id, id), :));

    <span class="comment">% print out subject settings</span>
    fprintf(<span class="string">"\n&lt;strong&gt;Subject Settings:&lt;/strong&gt;\n"</span>);
    fileName = fullfile(<span class="string">"data"</span>, sprintf(<span class="string">"sub-%d"</span>, subject_num), <span class="string">"eeg"</span>, sprintf(<span class="string">"sub-%d_task-SemanticCategorization_eeg.json"</span>, subject_num));
    jsonData = jsondecode(fileread(fileName));
    disp(jsonData);
<span class="keyword">end</span>
</pre>
<h2 id="5">Data Filtering Function</h2>
<p>This function includes bandpass filtering and notch filtering, both of which help reduce noise and improve signal clarity in the EEG data.</p>
<p>Bandpass filtering isolates signals within a specific frequency range, removing frequencies outside of this range to focus on meaningful brain activity. The user is prompted to input lower and upper bounds between 0.1 Hz and 40 Hz — the typical range for EEG analysis, as it captures key brainwave patterns such as delta, theta, alpha, beta, and gamma waves. If the user inputs values outside this range or sets the upper bound lower than the lower bound, the program triggers an error and asks for valid inputs. Once the program receives valid values, it uses the pop_eegfiltnew() function to apply the bandpass filter, preserving only the signals within the chosen frequency band. For instance, setting the range to 1–30 Hz would eliminate low-frequency drifts and high-frequency noise, making brainwave patterns more discernible.</p>
<p>Notch filtering, on the other hand, targets narrow-band interference, such as powerline noise, which typically occurs at 50 Hz (in most countries) or 60 Hz (in North America). The user can select either 50 Hz or 60 Hz for the notch filter, and the program will apply it to remove the constant-frequency interference that often appears as spikes in EEG data. Removing powerline noise helps uncover subtle patterns in brain activity that might otherwise be masked by electrical interference. By applying both bandpass and notch filtering, the program ensures that the processed EEG data is cleaner and more suitable for accurate time- frequency analysis.</p>
<pre class="codeinput"><span class="keyword">function</span> [data, low, upper, noise_num] = ip_data_filter(subject_num)

    fprintf(<span class="string">"\n&lt;strong&gt;EEG Data Filtering Begins&lt;/strong&gt;\n"</span>);
    currentPath = <span class="string">"/Users/mixuan/Desktop/Ulty_Multy"</span>; <span class="comment">% current directory</span>

    <span class="comment">% the file for reading EEG data</span>
    fileName = <span class="string">"sub-"</span> + int2str(subject_num) + <span class="string">"_task-SemanticCategorization_eeg.set"</span>;

    <span class="comment">% the path for the EEG data file</span>
    filePath = fullfile(currentPath, <span class="string">"data"</span>, <span class="string">"sub-"</span> + int2str(subject_num), <span class="string">"eeg"</span>);

    cd(filePath); <span class="comment">% change to file directory</span>

    <span class="comment">% load eeg data list from the data of user-chosen subject</span>
    <span class="comment">% use char() to avoid '.set' being truncated</span>
    EEG = pop_loadset(char(fileName));

    cd(currentPath); <span class="comment">% change to working directory</span>
    checker = true; <span class="comment">% while loop control variable</span>
    checker2 = true; <span class="comment">% another loop control variable</span>
    low = 0; <span class="comment">% initialize the lower bound</span>
    upper = 0; <span class="comment">% initialize the upper bound</span>
    noise_num = 0; <span class="comment">% initialize the powerline to be removed</span>

    <span class="comment">% bandpass filter bounds from user input</span>
    <span class="keyword">while</span> checker
        indicator = input(<span class="string">"Do you want to bandpass filter (y/n)? "</span>, <span class="string">'s'</span>);

        <span class="comment">% When the user wants a bandpass filter</span>
        <span class="keyword">if</span> strcmp(lower(indicator), <span class="string">"y"</span>)

            <span class="comment">% ask for lower bound input</span>
            <span class="keyword">while</span> checker2
                low = input(<span class="string">"Enter the lower bound in Hz: "</span>);
                <span class="keyword">if</span> low &lt; 0.1
                    fprintf(<span class="string">"Entered lower bound is too small!\n"</span>)
                    fprintf(<span class="string">"Please enter a positive number greater or equal to 0.1 Hz!\n"</span>)
                <span class="keyword">else</span>
                    checker2 = false;
                <span class="keyword">end</span>
            <span class="keyword">end</span>

            <span class="comment">% ask for upper bound input</span>
            checker2 = true;
            <span class="keyword">while</span> checker2
                upper = input(<span class="string">"Enter the upper bound in Hz: "</span>);
                <span class="keyword">if</span> upper &gt; 40
                    fprintf(<span class="string">"Entered upper bound is too high!\n"</span>)
                    fprintf(<span class="string">"Please enter a positive number smaller than 40 Hz!\n"</span>)
                <span class="keyword">elseif</span> upper &lt; low
                    fprintf(<span class="string">"Entered upper bound is too low!\n"</span>)
                    fprintf(<span class="string">"Upper bound must be higher than lower bound!\n"</span>)
                <span class="keyword">else</span>
                    checker2 = false;
                <span class="keyword">end</span>
            <span class="keyword">end</span>

            <span class="comment">% Bandpass filter in the desired Hz range</span>
            EEG = pop_eegfiltnew(EEG, low, upper);

            checker = false;
        <span class="comment">% When the user doesn't want a bandpass filter</span>
        <span class="keyword">elseif</span> strcmp(lower(indicator), <span class="string">"n"</span>)
            checker = false;
        <span class="keyword">end</span>
    <span class="keyword">end</span>

    <span class="comment">% noise removal</span>
    checker = true;
    <span class="keyword">while</span> checker
        indicator = input(<span class="string">"Do you want to remove a specific powerline (y/n)? "</span>, <span class="string">'s'</span>);

        <span class="comment">% When the user wants a noise removal</span>
        <span class="keyword">if</span> strcmp(lower(indicator), <span class="string">'y'</span>)
            noise_num = menu(<span class="string">"Enter the notch filter to be filtered out"</span>, <span class="string">"50 Hz (common in Europe and most countries)"</span>, <span class="string">"60 Hz (common in North America)"</span>);

            <span class="comment">% convert 1, 2 (index) to 50, 60 (notch filter)</span>
            noise_num = 40 + 10 * noise_num;

            <span class="comment">% notch filtering</span>
            EEG = pop_eegfiltnew(EEG, noise_num - 1, noise_num + 1, [], 1);
            checker = false;

        <span class="comment">% When the user doesn't want a noise removal</span>
        <span class="keyword">elseif</span> strcmp(lower(indicator), <span class="string">'n'</span>)
            checker = false;

        <span class="comment">% When the user falsely indicates if they want a noise removal or</span>
        <span class="comment">% not, the program skips the noise removal processing</span>
        <span class="keyword">else</span>
            fprintf(<span class="string">"Please enter either 'y' or 'n'\n"</span>);
        <span class="keyword">end</span>
    <span class="keyword">end</span>

    <span class="comment">% function output</span>
    data = EEG;
    fprintf(<span class="string">"\nEEG Data Filtering Successful\n"</span>);
<span class="keyword">end</span>
</pre>
<h2 id="6">Time Frequency Analysis Function</h2>
<pre class="codeinput"><span class="keyword">function</span> [power, freqs] = ip_time_frequency_analysis(input_data)

    <span class="comment">% inform the user of the analysis type</span>
    fprintf(<span class="string">"\n&lt;strong&gt;Time Frequency Analysis&lt;/strong&gt;\n"</span>);

    EEG = input_data;
    channels_num = size(EEG.data, 1); <span class="comment">% number of channels</span>

    <span class="comment">% cell arrays contain elements with different types</span>
    power = cell(1, channels_num); <span class="comment">% a cell array to store power</span>

    freqs = []; <span class="comment">% frequency initialization</span>
    checker = true; <span class="comment">% loop control variable</span>

<span class="comment">% Wavelet Decomposition for each (typically 32) channel</span>
    <span class="keyword">for</span> ch = 1:channels_num
        [power{ch}, freqs] = timefreq(EEG.data(ch, :), EEG.srate, <span class="string">'freqs'</span>, [1, 60]);
    <span class="keyword">end</span>

<span class="comment">% Power Spectrum for individual channels</span>
    <span class="keyword">while</span> checker
        checker2 = true; <span class="comment">% loop control variable</span>
        <span class="keyword">while</span> checker2
            channel = input(<span class="string">"\n\nWhich channel would you like to visualize? "</span>);
            <span class="keyword">if</span> ~isnumeric(channel)
                fprintf(<span class="string">"\nPlease enter a numeric value!\n"</span>);
            <span class="keyword">elseif</span> isnumeric(channel) &amp; (channel &lt; 1 | channel &gt; channels_num)
                fprintf(<span class="string">"\nPlease enter a number between 1 and %i!\n"</span>, channels_num);
            <span class="keyword">else</span>
                checker2 = false;
            <span class="keyword">end</span>
        <span class="keyword">end</span>

        <span class="comment">% Plotting</span>
        figure;
        imagesc([], freqs, abs(power{channel})); <span class="comment">% plot power magnitude</span>
        xlabel(<span class="string">"Time (ms)"</span>);
        ylabel(<span class="string">"Frequency (Hz)"</span>);
        title([<span class="string">"Time-Frequency Representation: Channel "</span>, num2str(channel)]);
        colorbar;

        <span class="comment">% wait until the figure is closed by the user</span>
        waitfor(gcf);

        <span class="comment">% Plot another channel</span>
        checker2 = input(<span class="string">"Do you want to visualize another channel (y/n)? "</span>, <span class="string">"s"</span>);
        <span class="keyword">if</span> strcmp(lower(checker2), <span class="string">"n"</span>)
            checker = false;
        <span class="keyword">elseif</span> ~strcmp(lower(checker2), <span class="string">"y"</span>)
            fprintf(<span class="string">"\nInput Error!!\n\n"</span>);
            checker = false;
        <span class="keyword">end</span>
    <span class="keyword">end</span>
    fprintf(<span class="string">"\nTime Frequency Analysis and Visualization Successful.\n"</span>);
<span class="keyword">end</span>
</pre>
<pre class="codeinput"><span class="keyword">function</span> ip_brain_plot(data, subject_num)
</pre>
<h2 id="8"></h2>
<h2 id="9">INITIALIZATION</h2>
<pre class="codeinput">    EEG = data; <span class="comment">% EEG data from user input</span>
    chanlocs = EEG.chanlocs; <span class="comment">% extract channel locations</span>
    checker = true; <span class="comment">% loop control variable</span>
</pre>
<h2 id="10"></h2>
<h2 id="11">CALCULATIONS</h2>
<pre class="codeinput">    channels = readtable(sprintf(<span class="string">"data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv"</span>, subject_num, subject_num), <span class="string">"FileType"</span>, <span class="string">"text"</span>, <span class="string">"Delimiter"</span>, <span class="string">"\t"</span>);
    <span class="comment">% extract the channels for the given subject number from the file</span>
    labels = channels.name; <span class="comment">% extract the name column of the channels to show in the final 3D graph</span>
</pre>
<h2 id="12"></h2>
<h2 id="13">FORMATTED TEXT &amp; FIGURE DISPLAYS</h2>
<pre class="codeinput">    fprintf(<span class="string">"\n&lt;strong&gt;Brain Plotting Begins&lt;/strong&gt;\n"</span>);
    <span class="comment">% ask the user if they want to highlight a specific channel</span>
    <span class="keyword">while</span> checker
        indicator = input(<span class="string">"Do you want to highlight a specific channel (y/n)? "</span>, <span class="string">"s"</span>);
        <span class="keyword">if</span> strcmp(lower(indicator), <span class="string">"n"</span>)
            checker = false;
        <span class="keyword">elseif</span> strcmp(lower(indicator), <span class="string">"y"</span>)
            checker = false;
            highlight = menu(<span class="string">"Choose the channel name that you want it to be highlighted."</span>, labels);
        <span class="keyword">else</span>
            fprintf(<span class="string">"Please enter 'y' or 'n'!\n"</span>);
        <span class="keyword">end</span>
    <span class="keyword">end</span>

    figure;
    hold <span class="string">on</span>;

    <span class="comment">% iterate through each EEG channel as a point</span>
    <span class="keyword">for</span> i = 1:length(chanlocs)
        <span class="keyword">if</span> ~isempty(labels{i}) <span class="comment">% Check if the label exists</span>
            <span class="comment">% locates each channel to the correct coordination</span>
            plot3(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z);

            <span class="comment">% determine highlight</span>
            <span class="keyword">if</span> exist(<span class="string">"highlight"</span>, <span class="string">"var"</span>) &amp; i == highlight
                <span class="comment">% variable "highlight" doesn't exist if the user didn't</span>
                <span class="comment">% specify it</span>
                color = <span class="string">"red"</span>;
            <span class="keyword">else</span>
                color = <span class="string">"black"</span>; <span class="comment">% the color of the highlighted channel on the 3D brain map, default black</span>
            <span class="keyword">end</span>

            <span class="comment">% add each label name to the data points</span>
            text(chanlocs(i).X, chanlocs(i).Y, chanlocs(i).Z, <span class="keyword">...</span>
                labels{i}, <span class="string">'FontSize'</span>, 10, <span class="string">'FontWeight'</span>, <span class="string">'bold'</span>, <span class="string">'HorizontalAlignment'</span>, <span class="string">'left'</span>, <span class="string">'Color'</span>, color);

        <span class="keyword">end</span>
    <span class="keyword">end</span>

    <span class="comment">% professional naming of the plot</span>
    xlabel(<span class="string">"X"</span>);
    ylabel(<span class="string">"Y"</span>);
    zlabel(<span class="string">"Z"</span>);
    title(<span class="string">"3D Representation of EEG Channels"</span>);

    <span class="comment">% adjust view angle</span>
    view(3);
    <span class="comment">% axis equal;</span>
        <span class="comment">% since brain is not a sphere, we need the relative scale of X, Y</span>
        <span class="comment">% and Z</span>
    grid <span class="string">on</span>;
    waitfor(gcf); <span class="comment">% wait until the graph is closed to proceed to the next step</span>
</pre>
<h2 id="14"></h2>
<pre class="codeinput"><span class="keyword">end</span>

<span class="keyword">function</span> ip_final_display(subject_num, low, upper, noise_num, freqs, power_spec)
</pre>
<pre class="codeinput">    <span class="comment">% compare the target to all of the subjects</span>
    <span class="comment">% Data Packaging</span>
</pre>
<h2 id="17">Initialization</h2>
<pre class="codeinput">    fprintf(<span class="string">"\n&lt;strong&gt;Final Analysis Results:&lt;/strong&gt;\n\n"</span>);
    subject_count = 27; <span class="comment">% There are a total of 27 subjects with 3 missing data</span>
    invalid_num = [14 15 25]; <span class="comment">% no subjects found</span>
    current_subject = 1; <span class="comment">% subjects to iterate through, starting from 1</span>
    currentPath = <span class="string">"/Users/mixuan/Desktop/Ulty_Multy"</span>; <span class="comment">% data directory</span>
    resultsPath = <span class="string">"/Users/mixuan/Desktop/Ulty_Multy/Results"</span>; <span class="comment">% results directory</span>
    channels_num = 32; <span class="comment">% number of channels in the given data</span>
</pre>
<h2 id="18">ip_brain_plot.m</h2>
<pre class="codeinput">    channels = readtable(sprintf(<span class="string">"data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv"</span>, subject_num, subject_num), <span class="string">"FileType"</span>, <span class="string">"text"</span>, <span class="string">"Delimiter"</span>, <span class="string">"\t"</span>);
    labels = channels.name;
    <span class="comment">% names of the 32 channels</span>

    <span class="comment">% iterate through each subject to analyze and get the data</span>
    <span class="keyword">while</span> current_subject &lt;= subject_count
</pre>
<h2 id="19">ip_subject_info.m</h2>
<p>check if the current subject is the target subject</p>
<pre class="codeinput">        current_subject = current_subject + (current_subject == subject_num) * (current_subject &lt; subject_count);
        <span class="comment">% check if the subject number is invalid</span>
        <span class="keyword">if</span> current_subject &gt;= invalid_num(1) &amp;&amp; current_subject &lt;= invalid_num(end)
            <span class="keyword">for</span> i = 1:length(invalid_num)
                current_subject = current_subject + (current_subject == invalid_num(i));
            <span class="keyword">end</span>
        <span class="keyword">end</span>
</pre>
<h2 id="20">ip_data_filter</h2>
<p>filter each subject data with the bandwith given to the target subject</p>
<pre class="codeinput">        fileName = <span class="string">"sub-"</span> + int2str(current_subject) + <span class="string">"_task-SemanticCategorization_eeg.set"</span>; <span class="comment">% the file for reading EEG data</span>
        filePath = fullfile(currentPath, <span class="string">"data"</span>, <span class="string">"sub-"</span> + int2str(current_subject), <span class="string">"eeg"</span>); <span class="comment">% the path for the EEG data file</span>
        cd(filePath); <span class="comment">% change to file directory</span>
        EEG = pop_loadset(char(fileName)); <span class="comment">% load eeg data list from the current subject</span>
        cd(currentPath) <span class="comment">% back to script directory</span>
        <span class="comment">% bandpass filter</span>
        <span class="keyword">if</span> low ~= 0 &amp;&amp; upper ~= 0
            <span class="comment">% both "low ~= 0" and "upper ~= 0" are numeric scales -&gt;</span>
            <span class="comment">% use &amp;&amp; instead of &amp; for performance</span>
            EEG = pop_eegfiltnew(EEG, low, upper); <span class="comment">% Bandpass filter in the desired Hz range</span>
        <span class="keyword">end</span>
        <span class="comment">% noise removal</span>
        <span class="keyword">if</span> noise_num ~= 0
            EEG = pop_eegfiltnew(EEG, noise_num - 1, noise_num + 1, [], 1); <span class="comment">% notch filter</span>
        <span class="keyword">end</span>
</pre>
<h2 id="21">ip_time_frequency_analysis.m</h2>
<pre class="codeinput">        fig = figure(<span class="string">"Visible"</span>, <span class="string">"off"</span>); <span class="comment">% Set the figure to be invisible</span>
        layout = tiledlayout(4, 8, <span class="string">'Padding'</span>, <span class="string">'compact'</span>, <span class="string">'TileSpacing'</span>, <span class="string">'compact'</span>); <span class="comment">% % 4 rows, 8 columns for 32 subplots</span>
        <span class="keyword">for</span> ch = 1:channels_num
            <span class="comment">% Wavelet Decomposition for each channel</span>
            power_data = timefreq(EEG.data(ch, :), EEG.srate, <span class="string">'freqs'</span>, [1, 60]); <span class="comment">% power data for this specific channel</span>
            <span class="comment">% only need the power data, neglecting the frequency</span>
            nexttile;
            plot(freqs, abs(power_data), <span class="string">'Color'</span>, [0.7, 0.7, 0.7, 0.03]); <span class="comment">% Compared subject data in gray</span>
            hold <span class="string">on</span>; <span class="comment">% stay on the same figure</span>
            plot(freqs, abs(power_spec{ch}), <span class="string">'Color'</span>, [1, 0, 0, 0.006], <span class="string">"LineWidth"</span>, 1.5); <span class="comment">% Target subject data in red</span>
            title(sprintf(<span class="string">"%s"</span>, labels{ch}), <span class="string">"FontWeight"</span>, <span class="string">"bold"</span>, <span class="string">'Units'</span>, <span class="string">'normalized'</span>, <span class="string">'Position'</span>, [1, 1, 1]); <span class="comment">% Channel name for each subplot</span>
        <span class="keyword">end</span>

        <span class="comment">% Graph formatting for all subplots</span>
        xlabel(layout, <span class="string">"Frequency (Hz)"</span>, <span class="string">"FontWeight"</span>, <span class="string">"bold"</span>); <span class="comment">% overall y label</span>
        ylabel(layout, <span class="string">"Power (VA)"</span>, <span class="string">"FontWeight"</span>, <span class="string">"bold"</span>); <span class="comment">% overall x label</span>
        title(layout, sprintf(<span class="string">"Subject %i - Gray vs. Target Subject - Red (%i)"</span>, current_subject, subject_num)); <span class="comment">% overall title</span>

        saveas(fig, fullfile(resultsPath, sprintf(<span class="string">"output_%i.png"</span>, current_subject))); <span class="comment">% save the graph file</span>
        close(fig); <span class="comment">% close the current figure</span>

        fprintf(<span class="string">"\n&lt;strong&gt;Final display progress: subject %i&lt;/strong&gt;\n\n"</span>, current_subject);
        current_subject = current_subject + 1; <span class="comment">% change to the next subject</span>
</pre>
<pre class="codeinput">    <span class="keyword">end</span>
</pre>
<pre class="codeinput"><span class="keyword">end</span>
</pre>
<p class="footer">
<br>
<a href="https://www.mathworks.com/products/matlab/">Published with MATLAB® R2024b</a>
<br>
</p>
</div>
<!--
##### SOURCE BEGIN #####
%% Ulty Multy - EEG Data Analysis and Visualization 
% Welcome to the tutorial of Ulty Multy ! 
% 
% This project utilizes the open data from OpenNeuro to analyze and
% visualize EEG data. 

%% Foreword 
% 
% After 

%% Main Script  
% This is the file to run to start the program 

% asks for user consent to perform data analysis 
consent = ip_welcome(); 
% 
% When Consent is given 
% 
if consent

    % load subject data

    par = readtable("data/participants.tsv", "FileType","text", "Delimiter", "\t"); 
    
    % display user info 
    subject_num = ip_subject_info(par); 
    
    % filter data 
    [data, low, upper, noise_num] = ip_data_filter(subject_num); 
    
    % perform time frequency analysis and visualize the user-selected 
    % channel(s)
    [power, freqs1] = ip_time_frequency_analysis(data); 
    
    % view the relative location of each channel in a 3D interactive graph
    ip_brain_plot(data, subject_num); 
    
    % compare the data of the target subject to the entire subject pool in 
    % each channel
    ip_final_display(subject_num, low, upper, noise_num, freqs1, power); 
    fprintf("\nAnalysis Successful.\n\n");

% When consent is not given 
else 
    fprintf("\nPermission Denied!\n");
    fprintf("\nAnalysis Unsuccessful.\n\n");
end

%% Welcome Function 
% This function begins with a welcome message explaining the data collection 
% process, providing users with background information to help interpret 
% the analysis results. The program then asks for consent to analyze the 
% user’s local data. If consent is denied, the program ends without 
% performing any analysis. While the open data used for this project is 
% stored locally, requesting consent is essential when handling real user 
% data in future applications.

function consent = ip_welcome()
    % INITIALIZATION   
    fileName = "README"; % the name of the file to be displayed 
    dir = "data"; % file directory 
    filePath = fullfile(pwd, dir, fileName); % path to the file 
    
    % check if the file exists 
    if isfile(filePath) 
        content = fileread(filePath); % read the file as a char array 
    else
        content = '';
        fprintf("\nFile not found!\n");
    end
    
    % Printed Output 
    fprintf("Welcome to the EEG Data Analysis Tool.\n")
    fprintf("This tool is designed to perform different analysis on the given data as follows: \n\n")
    disp(content); % Data Collection Process 

    % Ask for user's consent 
    consent = input("Do you allow this tool to perform data analysis (y/n)? ", "s");
    if strcmp(lower(consent), 'y')
        fprintf("\nThank you for your permission!\n")
        fprintf("A series of analysis will be performed shortly.\n");
        consent = true;
    else 
        consent = false;
    end
end

%% Subject Number & Info Function 
% This function prompts the user to select a target subject (between 1 and 
% 27) for analysis. If the input is invalid or out of range, the program 
% will continue asking until a valid input is provided. The function then 
% reads a .tsv file to display the selected subject’s demographics and data 
% collection settings. This helps the user identify potential influencing 
% factors when comparing data across subjects.

function subject_num = ip_subject_info(par)
    
    % INITIALIZATION
    invalid_num = [14 15 25]; % no subjects found 
    len = length(invalid_num); % number of invalid numbers 
    checker = true; % while loop control variable 
    bool = true; % loop control variable 
    
    % subject_num error check 
    while checker 
        % ask for subject number from user input
        subject_num = input("Which subject are you looking for? Enter a number between 1 and 27 (inclusive) REPLACE_WITH_DASH_DASH> "); 
        
        % When the subject number is in the given range 
        if (subject_num >= 1 && subject_num <= 27) 
            for i = 1:len % length of invalid_num 
                if subject_num == invalid_num(i)
                    fprintf("\nSubject not found!\n\n");
                    bool = false; 
                end
            end
            if bool
                checker = false; % stop the while loop 
            end
            bool = true;
        
        % When the subject number is out of range 
        else 
            fprintf("\nError! Enter a number between 1 to 27 (inclusive)!\n\n");
        end 
    end 
    
    % target subject ID 
    id = "sub-" + int2str(subject_num); 
    
    % print out subject info 
    fprintf("\n<strong>Subject Info:</strong>\n");

    % match: similar to the "find" function but comparing in tables 
    disp(par(matches(par.participant_id, id), :)); 

    % print out subject settings 
    fprintf("\n<strong>Subject Settings:</strong>\n");
    fileName = fullfile("data", sprintf("sub-%d", subject_num), "eeg", sprintf("sub-%d_task-SemanticCategorization_eeg.json", subject_num));
    jsonData = jsondecode(fileread(fileName));
    disp(jsonData); 
end 

%% Data Filtering Function 
% This function includes bandpass filtering and notch filtering, both of 
% which help reduce noise and improve signal clarity in the EEG data. 
% 
% Bandpass filtering isolates signals within a specific frequency range, 
% removing frequencies outside of this range to focus on meaningful brain 
% activity. The user is prompted to input lower and upper bounds between 
% 0.1 Hz and 40 Hz — the typical range for EEG analysis, as it captures 
% key brainwave patterns such as delta, theta, alpha, beta, and gamma waves. 
% If the user inputs values outside this range or sets the upper bound 
% lower than the lower bound, the program triggers an error and asks for 
% valid inputs. Once the program receives valid values, it uses the 
% pop_eegfiltnew() function to apply the bandpass filter, preserving only 
% the signals within the chosen frequency band. For instance, setting the 
% range to 1–30 Hz would eliminate low-frequency drifts and high-frequency 
% noise, making brainwave patterns more discernible.
% 
% Notch filtering, on the other hand, targets narrow-band interference, 
% such as powerline noise, which typically occurs at 50 Hz (in most 
% countries) or 60 Hz (in North America). The user can select either 50 Hz 
% or 60 Hz for the notch filter, and the program will apply it to remove 
% the constant-frequency interference that often appears as spikes in EEG 
% data. Removing powerline noise helps uncover subtle patterns in brain 
% activity that might otherwise be masked by electrical interference. By 
% applying both bandpass and notch filtering, the program ensures that the 
% processed EEG data is cleaner and more suitable for accurate time-
% frequency analysis.

function [data, low, upper, noise_num] = ip_data_filter(subject_num)

    fprintf("\n<strong>EEG Data Filtering Begins</strong>\n"); 
    currentPath = "/Users/mixuan/Desktop/Ulty_Multy"; % current directory 
    
    % the file for reading EEG data
    fileName = "sub-" + int2str(subject_num) + "_task-SemanticCategorization_eeg.set"; 

    % the path for the EEG data file 
    filePath = fullfile(currentPath, "data", "sub-" + int2str(subject_num), "eeg"); 
    
    cd(filePath); % change to file directory 

    % load eeg data list from the data of user-chosen subject
    % use char() to avoid '.set' being truncated 
    EEG = pop_loadset(char(fileName)); 
        
    cd(currentPath); % change to working directory 
    checker = true; % while loop control variable 
    checker2 = true; % another loop control variable 
    low = 0; % initialize the lower bound
    upper = 0; % initialize the upper bound 
    noise_num = 0; % initialize the powerline to be removed 

    % bandpass filter bounds from user input 
    while checker 
        indicator = input("Do you want to bandpass filter (y/n)? ", 's');
        
        % When the user wants a bandpass filter 
        if strcmp(lower(indicator), "y")

            % ask for lower bound input 
            while checker2
                low = input("Enter the lower bound in Hz: ");
                if low < 0.1
                    fprintf("Entered lower bound is too small!\n")
                    fprintf("Please enter a positive number greater or equal to 0.1 Hz!\n")
                else
                    checker2 = false;
                end
            end

            % ask for upper bound input 
            checker2 = true;
            while checker2
                upper = input("Enter the upper bound in Hz: ");
                if upper > 40
                    fprintf("Entered upper bound is too high!\n")
                    fprintf("Please enter a positive number smaller than 40 Hz!\n")
                elseif upper < low
                    fprintf("Entered upper bound is too low!\n")
                    fprintf("Upper bound must be higher than lower bound!\n")
                else
                    checker2 = false;
                end
            end

            % Bandpass filter in the desired Hz range 
            EEG = pop_eegfiltnew(EEG, low, upper); 

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
            noise_num = menu("Enter the notch filter to be filtered out", "50 Hz (common in Europe and most countries)", "60 Hz (common in North America)"); 
            
            % convert 1, 2 (index) to 50, 60 (notch filter)
            noise_num = 40 + 10 * noise_num; 

            % notch filtering 
            EEG = pop_eegfiltnew(EEG, noise_num - 1, noise_num + 1, [], 1); 
            checker = false;
        
        % When the user doesn't want a noise removal     
        elseif strcmp(lower(indicator), 'n')
            checker = false;
        
        % When the user falsely indicates if they want a noise removal or
        % not, the program skips the noise removal processing 
        else
            fprintf("Please enter either 'y' or 'n'\n"); 
        end
    end
    
    % function output 
    data = EEG; 
    fprintf("\nEEG Data Filtering Successful\n");
end 

%% Time Frequency Analysis Function 
function [power, freqs] = ip_time_frequency_analysis(input_data)

    % inform the user of the analysis type 
    fprintf("\n<strong>Time Frequency Analysis</strong>\n"); 

    EEG = input_data;
    channels_num = size(EEG.data, 1); % number of channels 
    
    % cell arrays contain elements with different types 
    power = cell(1, channels_num); % a cell array to store power 
        
    freqs = []; % frequency initialization 
    checker = true; % loop control variable 

% Wavelet Decomposition for each (typically 32) channel 
    for ch = 1:channels_num
        [power{ch}, freqs] = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', [1, 60]);
    end

% Power Spectrum for individual channels 
    while checker 
        checker2 = true; % loop control variable 
        while checker2 
            channel = input("\n\nWhich channel would you like to visualize? ");
            if ~isnumeric(channel)
                fprintf("\nPlease enter a numeric value!\n");
            elseif isnumeric(channel) & (channel < 1 | channel > channels_num)
                fprintf("\nPlease enter a number between 1 and %i!\n", channels_num);
            else
                checker2 = false;
            end
        end

        % Plotting 
        figure;
        imagesc([], freqs, abs(power{channel})); % plot power magnitude 
        xlabel("Time (ms)");
        ylabel("Frequency (Hz)");
        title(["Time-Frequency Representation: Channel ", num2str(channel)]);
        colorbar;
        
        % wait until the figure is closed by the user
        waitfor(gcf); 

        % Plot another channel 
        checker2 = input("Do you want to visualize another channel (y/n)? ", "s");
        if strcmp(lower(checker2), "n")
            checker = false;
        elseif ~strcmp(lower(checker2), "y")
            fprintf("\nInput Error!!\n\n");
            checker = false;
        end
    end
    fprintf("\nTime Frequency Analysis and Visualization Successful.\n");
end 

%% 
function ip_brain_plot(data, subject_num)
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

function ip_final_display(subject_num, low, upper, noise_num, freqs, power_spec)
    % compare the target to all of the subjects 
    % Data Packaging 

    %% Initialization 
    fprintf("\n<strong>Final Analysis Results:</strong>\n\n");
    subject_count = 27; % There are a total of 27 subjects with 3 missing data 
    invalid_num = [14 15 25]; % no subjects found 
    current_subject = 1; % subjects to iterate through, starting from 1
    currentPath = "/Users/mixuan/Desktop/Ulty_Multy"; % data directory 
    resultsPath = "/Users/mixuan/Desktop/Ulty_Multy/Results"; % results directory 
    channels_num = 32; % number of channels in the given data 
    
    %% ip_brain_plot.m
    channels = readtable(sprintf("data/sub-%d/eeg/sub-%d_task-SemanticCategorization_channels.tsv", subject_num, subject_num), "FileType", "text", "Delimiter", "\t");
    labels = channels.name;
    % names of the 32 channels 

    % iterate through each subject to analyze and get the data 
    while current_subject <= subject_count
        %% ip_subject_info.m
        % check if the current subject is the target subject 
        current_subject = current_subject + (current_subject == subject_num) * (current_subject < subject_count);
        % check if the subject number is invalid 
        if current_subject >= invalid_num(1) && current_subject <= invalid_num(end)
            for i = 1:length(invalid_num)
                current_subject = current_subject + (current_subject == invalid_num(i));
            end
        end
        
        %% ip_data_filter 
        % filter each subject data with the bandwith given to the target
        % subject 
        fileName = "sub-" + int2str(current_subject) + "_task-SemanticCategorization_eeg.set"; % the file for reading EEG data
        filePath = fullfile(currentPath, "data", "sub-" + int2str(current_subject), "eeg"); % the path for the EEG data file 
        cd(filePath); % change to file directory 
        EEG = pop_loadset(char(fileName)); % load eeg data list from the current subject 
        cd(currentPath) % back to script directory 
        % bandpass filter 
        if low ~= 0 && upper ~= 0
            % both "low ~= 0" and "upper ~= 0" are numeric scales ->
            % use && instead of & for performance 
            EEG = pop_eegfiltnew(EEG, low, upper); % Bandpass filter in the desired Hz range 
        end
        % noise removal 
        if noise_num ~= 0
            EEG = pop_eegfiltnew(EEG, noise_num - 1, noise_num + 1, [], 1); % notch filter 
        end
        
        %% ip_time_frequency_analysis.m 
        fig = figure("Visible", "off"); % Set the figure to be invisible 
        layout = tiledlayout(4, 8, 'Padding', 'compact', 'TileSpacing', 'compact'); % % 4 rows, 8 columns for 32 subplots
        for ch = 1:channels_num
            % Wavelet Decomposition for each channel 
            power_data = timefreq(EEG.data(ch, :), EEG.srate, 'freqs', [1, 60]); % power data for this specific channel 
            % only need the power data, neglecting the frequency 
            nexttile;
            plot(freqs, abs(power_data), 'Color', [0.7, 0.7, 0.7, 0.03]); % Compared subject data in gray 
            hold on; % stay on the same figure 
            plot(freqs, abs(power_spec{ch}), 'Color', [1, 0, 0, 0.006], "LineWidth", 1.5); % Target subject data in red
            title(sprintf("%s", labels{ch}), "FontWeight", "bold", 'Units', 'normalized', 'Position', [1, 1, 1]); % Channel name for each subplot 
        end 

        % Graph formatting for all subplots 
        xlabel(layout, "Frequency (Hz)", "FontWeight", "bold"); % overall y label 
        ylabel(layout, "Power (VA)", "FontWeight", "bold"); % overall x label 
        title(layout, sprintf("Subject %i - Gray vs. Target Subject - Red (%i)", current_subject, subject_num)); % overall title 
        
        saveas(fig, fullfile(resultsPath, sprintf("output_%i.png", current_subject))); % save the graph file 
        close(fig); % close the current figure 

        fprintf("\n<strong>Final display progress: subject %i</strong>\n\n", current_subject);
        current_subject = current_subject + 1; % change to the next subject 
    end

    
end
##### SOURCE END #####
-->


</body></html>

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
