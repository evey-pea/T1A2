# Gem Requiremnts

# require 'smarter_csv' # ver 1.2.6
# require 'tty-screen' # ver 0.7.1
# require 'tty-reader' # ver 0.7.0
# require 'tty-prompt' # ver 0.21.0
# require 'tty-config' # ver 0.21.0

# Loads files containing local modules
require "./modules/CommandLine.rb"
require "./modules/CSV_IO_Stream.rb"
# require "./modules/DataManipulation.rb"

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
        :data
    # Load the Commandline module
    include CommandLine
    include CSV_Parse    
    def initialize
        # Exit status is used to terminate program
        @exit_status = false
        @data = []
        # Perform checks on commandline input and sets exit status to true if incorrect values are passed
        # From CommandLine module
        check_ARGV_on_initialization()
        if for_terminal_output()
            do_terminal_output()
        end
        
    end   
    
    # Getter method to provide the value of @exit_status
    def exit
        return @exit_status
    end
end

# Initialise progam instance
program = MainProgramState.new

# while program.exit == false
    
# end
# # initialise program run time loop

# puts "Exiting program..."