require "./modules/CSV_IO.rb"
module Data_manipulation
    
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
    # Output index values without headers
    def index_output(index)
        output = ""
        entry = @data[index]
        # Put index at the start of the line
        output = "#{index.to_s.chomp} #: "
        for field in entry do
            output += (field + " ").chomp
        end
        return output.to_s
    end
    # Output header fields and count
    def header_output
        return [file_count_headers, @data[0]]
    end
    
    # Display header line for entry list
    def header_line
        return read_entry(0)
    end
    
    # Returns a nominated entry as an array object
    def read_entry(index)
        entry = []
        last = @data[index].length() -1
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
            return [header_line, entry_output]
        else 
            return [header_line, read_entry(index)]
        end
    end
    
    def index_output(string, array)
        puts "#{string}"
        puts array
    end
    
    # Transforms entry with header row (format: [[headers], [values]] into vertical entry array with format [[header, value]]
    def entry_transpose(entry)
        transpose_output = []
        
        i_max = entry[0].length() - 1
        for i in 0..i_max do
            transpose_output.push([entry[0][i],entry[1][i]])
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
        p "Do you wish to commit this as the new #{string}? (y/n)"
        answer = STDIN.gets.chomp
        if answer == "y"
            return true
        elsif answer == "n"
            return false
        else
            puts "Please answer with 'y' or 'n'"
            confirm_entry()
        end
    end
    
    include CSV_IO_handlers
    def edit_entry(index)
        # Utilise the read entry function to pull entry into temporary array object
        if index == nil
            return "No index specified for editing"
        elsif (index > (@data.length() - 1)) || index < 0
            puts "Entry not found."
        elsif index == 0
            puts"Editing file data headers..."
            headers = @data[0]
            puts "Enter new value for each header (leave prompt blank to retain the original header)"
            
            new_headers = []
            for header in headers do
                 print "#{header} << "
                 new_header = STDIN.gets.chomp
                 if new_header == ""
                    new_headers.push(header)
                 else
                    new_headers.push(new_header)
                 end
            end

            puts "New header list is..."
            puts new_headers
            if confirm_entry("header row")
                @data[0] = new_headers
                data_save(@file_name, @data)
                puts "Headers saved to file."
            else
                puts "No changes made."
            end
            
        else
            entry = file_output_entries(index)
            index_output("Original Entry...",entry)
            edit_entry = entry_transpose(entry)
            
            puts "Enter new value for each field (leave prompt blank to retain the original field value)"
            for field in edit_entry do
                puts "#{field[0]} : #{field[1]}"
                new_value = STDIN.gets.chomp
                if new_value == ""
                    new_value = field[1]
                else
                    field[1] = new_value 
                end
            end
            # Output temporary entry object
            index_output("Updated Entry...",edit_entry)
            p 
            if confirm_entry("updated entry")
                @data[index] = entry_pull_edited(edit_entry)
                data_save(@file_name, @data)
                puts "Entry saved to file."
            else
                puts "No changes made."
            end
        end
        
    end
end

# test = [["Name","age","hobby"], ["Mike",29,"Icecream"]]
# p test
# test1 = entry_transpose(test)
# p test1
# test2 = entry_pull_edited(test1)
#  p test2