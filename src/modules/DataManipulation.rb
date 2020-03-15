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
        last = @data[0].length() -1
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
    

    def edit_entry(index)
        # Utilise the read entry function to pull entry into temporary array object
        puts "in edit mode" 
        if index == nil
            return "No index specified for editing"
        else
            entry = read_entry(index)
            return entry.to_s
        end

        # # Iterate through temporary array object, prompting for a replacement value
        # puts "\n" + "Enter new values (or leave blank to retain previous value"
        # for field in entry do
        #     print "#{field[0]}: "
        #     new_value = gets.chomp
        #     if new_value == ""
        #         new_value = field[1]
        #     else
        #         field[1] = new_value
        #     end
        # end

        # # Output temporary entry object
        # return  entry_output("Updated Entry...",entry)
    end
end
