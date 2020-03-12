# Gem Requiremnts

require 'smarter_csv' # ver 1.2.6
require 'tty-screen' # ver 0.7.1
require 'tty-reader' # ver 0.7.0
# require 'tty-prompt' # ver 0.21.0
require 'tty-config' # ver 0.21.0

# Initialise the command line arguments to an array and make the reference global


# Create program class for state placeholders
class MainProgramState
    attr_accessor :exit_status,
        :line_limit,
        :all_output,
        :specify_index,
        :count_flag,
        :headers_flag,
        :entries_flag,
        :file_name,
        :number_passed

    def initialize
        @exit_status = false
        
        ## Command line value parsing

        # Method to use to determine if a string is numeric
        def is_number?(object)
            true if Float(object) rescue false
        end
        # Checks if no value is parsed after the program call 
        if ARGV.empty?
            # If no arguments are supplied, error messaged is logged to console and exit flag is set to true
            puts "No CSV file, flags, or commands specified."
            @exit_status = true
        else
            # Iterate through the arguments entered and use them to set flags in the program instance
            ARGV.each do |value|  
                # Set flags based on nominated argument calls
                case value
                when "-l"
                    @line_limit = true
                when "-a"
                    @all_output = true
                when "-i"
                    @specify_index = true
                when "--count"
                    @count_flag = true
                when "--headers"
                    @headers_flag = true
                when "--entries"
                    entries_flag = true
                else
                    # For all entries on the command line that are not static values (ie filenames, numbers and invalid commands)
                    # If value is numeric, assign it to @number_passed as an integer (float values will result in only numerals to the left of the decimal point being used)
                    if is_number?(value)
                        @number_passed = value.to_i
                    # If it is a string including the characters '.csv' assign it to @file_name
                    elsif value.include?(".csv")
                        @file_name = value
                    # For everything else, there is Mastercard. Error message will be logged to console and @exit_status will be set to 'true' to terminate the program 
                    else
                        puts "Invalid argument: #{value}"
                        @exit_status =true
                    end
                end
            end
        end

        # Check if command arguments passed
        count = 0
        if (@count_flag == true)
            count += 1
        end
        if (@headers_flag == true) 
                count += 1
        end
        if (@entries_flag == true)
            count += 1
        end
        if count > 1
            puts "Too many command arguments passed. Expected 1, recieved #{count}"
            @exit_status = true
        end
        
        # Check if flag arguments passed conflict with each other
        if (specify_index == true && line_limit == true)
            puts "Conflicting flags -i and -l."
            exit_status = true
        end
        if (specify_index == true && all_output == true)
            puts "Conflicting flags -i and -a."
            exit_status = true
        end
    end
    def exit
        return @exit_status
    end
    def file_name
        return "Filename: #{@file_name}"
    end
end

# Initialise progam instance
program = MainProgramState.new

while program.exit == false
    
end
# # initialise program run time loop

# puts "Exiting program..."