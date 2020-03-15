module CSV_IO_handlers
    # Loads data from CSV and returns it as nested array
    def data_load(filename)
        # Initialises empty array for output
        output = []
        # Read file line by line and push each line as an array to the output array
        File.open(filename, "r") do |file|
            for line in file.readlines()
                output.push(line.chomp.split(","))
            end
        end
        # Return nested aray object
        return output
    end

    require "csv"
    def data_save(filename, data)
        # Load Ruby Core CSV module 
        # Map data to CSV format using Ruby Core CSV module function ':to_csv'
        csv = data.map(&:to_csv).join
        # Write CSV data to file
        File.open(filename, "w" ) do |file|
            file.write(csv)
        end
    end
end