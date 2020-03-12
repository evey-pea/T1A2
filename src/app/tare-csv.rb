# Gem Requiremnts

require 'smarter_csv' # ver 1.2.6
require 'tty-screen' # ver 0.7.1
require 'tty-reader' # ver 0.7.0
# require 'tty-prompt' # ver 0.21.0
require 'tty-config' # ver 0.21.0

# Loads file containing Commandline module
require "./modules/CommandLine.rb"

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
    
    # Load the Commandline module
    include CommandLine
        
    def initialize
        # Exit status is used to terminate program
        @exit_status = false

        # Perform checks on commandline input and sets exit status to true if incorrect values are passed
        # From CommandLine module
        check_ARGV_on_initialization()
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

# while program.exit == false
    
# end
# # initialise program run time loop

# puts "Exiting program..."