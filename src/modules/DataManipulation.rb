module Data_manipulation
    # Set colour for alert messages
    require 'pastel'
    pastel = Pastel.new 
    $accepted = pastel.white.on_green.detach
    $rejected = pastel.white.on_red.detach
    $warning = pastel.black.on_yellow.detach
    
    require "./modules/CSV_IO.rb"
    # Counts number of items in first line of file
    def file_count_headers
        return "File header count: #{@data[0].length}"
    end
    
    # Returns a count of entries in file
    def file_count_entries
        return "File entry count: #{@data.length - 1}"
    end
    
    def file_count_headers_and_entries
        return [file_count_headers, file_count_entries]
    end
    # Output index values without headers as a single array
    def index_output_read(index)
        output = []
        entry = @data[index]
        for field in entry do
            output.push(field)
        end
        return output
    end
    # Output header fields and count
    def header_output
        return [file_count_headers, @data[0]]
    end
    
    # Display header line for entry list
    def header_line
        return @data[0]
    end
    
    # Returns a nominated entry as an array object
    def read_entry(index)
        entry = []
        last = @data[0].length() - 1
        for i in 0..last do
            entry.push(@data[index][i])
        end
        return entry
    end
    
    # Display entries with header line
    def file_output_entries(index)
        if index == 0
            entry_output =[]
            i = 1
            last_index = @data.length - 1
            for i in i..last_index do
                entry_output.push(read_entry(i))
            end
            return [header_line(), entry_output]
        else 
            return [header_line(), [read_entry(index)]]
        end
    end
    
    def index_output(string, array)
        puts "#{string}"
        puts display_table(array)
    end
    
    # Transforms entry with header row (format: [[headers], [values]] into vertical entry array with format [[header, value]]
    def entry_transpose(index)
        transpose_output = []
        entry = index_output_read(index)
        i_max = @data[0].length() -1
        for i in 0..i_max do
            transpose_output.push([@data[0][i],entry[i]])
        end 
        return transpose_output
    end
    
    # Takes array with properties [[header], [field]] and returns only [field] as a single dimension array
    def entry_pull_edited(list)
        output = []
        for field in list do
            output.push(field[1])
        end
        return output
    end
    
    
    # Prompt user to confirm that they wish to commit edited entry
    def confirm_entry(string)
        # Load tty-reader gem and initialise
        require 'tty-prompt'
        prompt = TTY::Prompt.new
        answer = prompt.yes?("Do you wish to commit this as the new #{string}?", convert: :bool)
        
        return answer
        
    end
    
    include CSV_IO_handlers
    
   

    def edit_entry(index)
        # Utilise the read entry function to pull entry into temporary array object
        if index == nil
            return $rejected.("No index specified for editing")
        elsif (index > (@data.length() - 1)) || index < 0
            puts $rejected.("Entry not found.")
        elsif index == 0
            puts $rejected.("Editing file header data labels...")
            headers = @data[0]
            puts $warning.("Enter new value for each header (leave prompt blank to retain the original header)")
            
            new_headers = []
            for header in headers do
                 print ("#{header} << ")
                 new_header = STDIN.gets.chomp
                 if new_header == ""
                    new_headers.push(header)
                 else
                    new_headers.push(new_header)
                 end
            end

            puts "New header list is..."
            puts (new_headers)
            if confirm_entry("header row")
                @data[0] = new_headers
                data_save(@file_name, @data)
                puts $accepted.("Headers saved to file.")
            else
                puts $rejected.("No changes made.")
            end 
        else
            index_output("Original Entry...",file_output_entries(index))
            edit_entry = entry_transpose(index)
            puts $warning.("Enter new value for each field (leave prompt blank to retain the original field value)")
            edit_output = []
            for field in edit_entry do
                print "#{field[0]} : "
                new_value = STDIN.gets.chomp
                if new_value == "" || nil
                    edit_output.push(field[1])
                else
                    edit_output.push(new_value) 
                end
            end
            
            edit_entry_headers = [header_line(),[edit_output]]

            # Output temporary entry object
            (index_output("Updated Entry...",edit_entry_headers))
            
            if confirm_entry("updated entry")
                @data[index] = edit_output
                data_save(@file_name, @data)
                puts $accepted.("Entry saved to file.")
            else
                puts $rejected.("No changes made.")
            end
        end     
    end
end