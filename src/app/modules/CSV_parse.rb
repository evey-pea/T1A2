# require 'smarter_csv'

filename = "./../data/test.csv"
# data = SmarterCSV.process(filename,{header_transformations: [:none, :keys_as_strings]})

require 'csv'
data = CSV.read(filename)

# p data
# def header
#     header_count = data[0].length
#     return "Headers #: #{header_count}"
# end

# def entry
#     entry_count = data.length
#     return "Lines #: #{entry_count - 1}"
# end

# i = 3
# for entry in data do
#     j = data.find_index(entry)
#     puts data[j][i].to_s
# end

# puts data[0].max.length()

def read_entry(array, index)
    last = array[0].length() -1
    for i in 0..last do
        puts "#{array[0][i]}: #{array[index][i]}"
        i += 1
    end
end

read_entry(data, 1)