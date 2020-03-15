

# Loads files containing local modules
require "./modules/CommandLine.rb"
require "./modules/CSV_IO.rb"
require "./modules/Pastel.rb"

# Create program class for state placeholders
class MainProgramState
    attr_accessor :exit_status,
        :all_output,
        :specify_index,
        :edit_flag,
        :count_flag,
        :headers_flag,
        :entries_flag,
        :file_name,
        :number_passed
        :data
        :conflict
    # Load the Commandline module
    include CommandLine
    include CSV_IO_handlers
    include PastelColors
    include CSV_IO_handlers
    def initialize
        # Exit status is used to terminate program
        @exit_status = false
        @conflict = false
        @data = []
        # Perform checks on commandline input and sets exit status to true if incorrect values are passed
        # From CommandLine module
        check_ARGV_on_initialization()
        if @file_name != nil
            @data = data_load(@file_name)
        end
        # Self testing method that tests if arguments are meant for terminal output only
        # it true, executes Terminal output and sets @exit_status to true to prevetn loading of main program loop
        do_terminal_output()
        @data = []
    end   
    
    # Getter method to provide the value of @exit_status
    def exit
        return @exit_status
    end
end

# Initialise progam instance
program = MainProgramState.new
# p program
# while program.exit == false
    
# end
# # initialise program run time loop

# puts "Exiting program..."