
module Tables
    require 'tty-table'

    def display_table(data_array)
        header = data_array[0] 
        rows = data_array[1]
        
        table = TTY::Table.new header, rows
        table.render(:unicode, resize: true, padding: [0,1,0,0])
    end
end

# test_data = [["Name", "Age", "Hobby"], ["Mike", 28, "Stamp Collecting"], ["Mike", 23, "Skating"], ["Geoff", 52, "Gardening"]]

# puts display_table(test_data)
