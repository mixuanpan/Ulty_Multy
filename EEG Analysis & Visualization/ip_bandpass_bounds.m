function [low, upper] = ip_bandpass_bounds()
    low = 0; % initialize the lower bound
    upper = 0; % initialize the upper bound 
    checker = true; % while loop control variable 
    checker2 = true; % another loop control variable 

    while checker % bandpass filter bounds from user input 
        indicator = input("Do you want to bandpass filter (y/n)? ", 's');
        if strcmp(lower(indicator), "y")
            while checker2
                low = input("Enter the lower bound in Hz: ");
                if low < 0.1
                    fprintf("Entered lower bound is too small!\n")
                    fprintf("Please enter a positive number greater or equal to 0.1 Hz!\n")
                else
                    checker2 = false;
                end
            end
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
            checker = false;
        elseif strcmp(lower(indicator), "n")
            checker = false;
        end
    end
end