# Load CSV class from core library
require 'csv'

# module CSV_Parse
    # Module testing variable
    filename = "./../data/test.csv"
    $data = CSV.read(filename)

    # Counts number of items in first line of file
    def file_count_headers
        return "File header count: #{$data[0].length}"
    end

    # Returns a count of entries in file
    def file_count_entries
        return "File entry count: #{$data.length - 1}"
    end

    # Output index values without headers
    def index_output(index)
        output = ""
        entry = $data[index]

        # Put index at the start of the line
        output = "#{index.to_s.chomp} #: "
        for field in entry do
            output += (field + " ").chomp
        end
        return output.to_s
    end
    # Output header fields and count
    def header_output
        return [file_count_headers, $data[0]]
    end

    # Returns a nominated entry as a nested array object
    def read_entry(array, index)
        entry = []
        last = array[0].length() -1
        for i in 0..last do
            entry.push([array[0][i].to_s, array[index][i].to_s])
            i += 1
        end
        return entry
    end
    
    
    def edit_entry(array,index)
        # Utilise the read entry function to pull entry into temporary array object
        entry = read_entry(array,index)
        
        def entry_output(string, entry)
            puts "\n" + string.to_s
            for field in entry do
                print "#{field[0]}: #{field[1]}" + "\n"
            end
            return nil
        end
        # Output entry to screen
        entry_output("Current Entry...", entry)

        # Iterate through temporary array object, prompting for a replacement value
        puts "\n" + "Enter new values (or leave blank to retain previous value"
        for field in entry do
            print "#{field[0]}: "
            new_value = gets.chomp
            if new_value == ""
                new_value = field[1]
            else
                field[1] = new_value
            end
        end

        # Output temporary entry object
        return  entry_output("Updated Entry...",entry)
    end
# end

puts header_output
# puts file_count_entries
# puts edit_entry($data,2).to_s

# # End of module file (required)
# end