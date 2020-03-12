# Gem Requiremnts

require 'smarter_csv' # ver 1.2.6
require 'tty-screen' # ver 0.7.1
require 'tty-reader' # ver 0.7.0
require 'tty-prompt' # ver 0.21.0
require 'tty-config' # ver 0.21.0

# Initialise the command line arguments to an array and make the reference global
$arguments = ARGV.to_a

# Create program class for state placeholders
class Main_program_state
    attr_accessor :exit_status,
        :line_limit,
        :all_output,
        :specify_index,
        :count_flag,
        :headers_flag,
        :entries_flag,
        :file_name

    def initialize
        @exit_status = false
        # Check if there are any any commands passed on the command line
        if $arguments.empty?
            # If no arguments are supplied, error messaged is logged to console and exit flag is set to true
            puts "No CSV file, flags, or commands specified."
            @exit_status = true
        else
            $arguments.each do |value|  
                case value
                when "-l"
                    # Find the integer for line limit and set the @line_limit value
                when "-a"
                    @all_output = true 
                when "-i"
                    # Find the integer to assign to the @specify_index vlaue
                when "--count"
                    @count_flag = true
                when "--headers"
                    @headers_flag = true
                when "--entries"
                    entries_flag = true
                else
                    
                end
            end
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
program = Main_program_state.new


# # initialise program run time loop
while program.exit == false 
    puts "In program"    
end

puts "Exiting program..."