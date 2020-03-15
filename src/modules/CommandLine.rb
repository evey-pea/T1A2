module CommandLine
    ## Command line value parsing
    ## Module is included in MainProgramClass
    
    # Load DataManipulation module file
    require "./modules/DataManipulation.rb"

    # Load DataManipulation module
    include Data_manipulation

    # Called in initialization of MainProgramClass
    def check_ARGV_on_initialization
        parse_ARGV()
        check_arguments()
        check_flags()
        check_arguments_with_flags()
    end

    # Method to use to determine if a string is numeric
    def is_number?(object)
        true if Float(object) rescue false
    end
    
    # Checks if no value is parsed after the program call 
    def parse_ARGV
        if ARGV.empty?
            # If no arguments are supplied, error messaged is logged to console and exit flag is set to true
            puts "No CSV file, flags, or commands specified."
            @exit_status = true
            @conflict = true
        else
            
        # Iterate through the arguments entered and use them to set flags in the program instance
        ARGV.each do |value|  
            # Set flags based on nominated argument calls
            case value
            when "-e"
                @edit_flag = true
            when "-a"
                @all_output = true
            when "-i"
                @specify_index = true
            when "--count"
                @count_flag = true
            when "--headers"
                @headers_flag = true
            when "--entries"
                @entries_flag = true
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
                    @exit_status = true
                    @conflict = true
                end
            end
        end
    end

    # Check if too many command arguments passed
    def check_arguments    
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
            @conflict = true
        end
    end

    # Check if flag arguments passed conflict with each other
    def check_flags
        # if (specify_index == true && line_limit == true)
        #     puts "Conflicting flags -i and -."
        #     @exit_status = true
        #     @conflict = true
        end
        if (specify_index == true && all_output == true)
            puts "Conflicting flags -i and -a."
            @exit_status = true
            @conflict = true
        end
    end

    # Check if flags other than "-l" are being called with arguments
    def check_arguments_with_flags
        if (@count_flag || @headers_flag || @entries_flag) && (@specify_index || @all_output)
            puts "Only '-l' flag can be used with arguments."
            @exit_status = true
            @conflict = true
        end
    end

    # Determines if arguments are for console output only
    # def for_terminal_output
    #     (@all_output || 
    #         @specify_index || 
    #         @count_flag || 
    #         @headers_flag ||
    #         @entries_flag)? true : false
    # end

    # Executes a command based on flags or arguements
    def do_terminal_output
        if (@all_output || @specify_index || @edit_flag || @count_flag || @headers_flag || @entries_flag) && (@file_name != nil)
            # Set exit status to true to prevent main program loading
            @exit_status = true
            if (@conflict == false)
                # Carry out terminal output
                if @all_output
                    # Print headers and entries to the limit of the number passed
                    puts file_output_entries(0)
                elsif @specify_index
                    # Specific index output
                    puts file_output_entries(@number_passed)
                elsif @edit_flag
                    puts edit_entry(@number_passed)
                elsif @count_flag
                    # Display header count and entry count
                    puts file_count_headers_and_entries
                elsif @headers_flag
                    # Display header count and header listing
                    puts header_output
                elsif @entries_flag
                    # Display number of entries
                    puts file_count_entries
                end
            end
        end
    end
end

# # End of module file
# end