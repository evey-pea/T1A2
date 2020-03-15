def display_help
    help_display = <<DESC

    
  ----------------------------------------------------------------------
   Terminal Application Read / Edit - Comma Seperated Values (tare-csv)
  ----------------------------------------------------------------------

  A ruby application for reading and editing CSV files via a terminal

  Example usage:  'tare-csv.rb [filename] [command] [number]'*

  *Commands, numbers and file name do not need to be in strict order.
    -All arguments are to be seperated with a space between them or an
    'invalid argument' error will be thrown.
    -Only one numbeer can be used, the program will default to the last 
    one on the line if more than one number is supplied.


  Terminal commands and parameters
  -----------------------------------

  There are several options that return information about the csv file 
  to the terminal. 
  
  Each of these terminal commands are only to be used on their own.

  **Command**        *Description*
    
          -a    Prints all entries to the screen (not recommended for 
                 large datasets)
          -i    Prints a specified index to the screen with file headers 
                > Requires a number to specify the index to be displayed

          -e    Edit mode. User must list an entry number to edit. 
                > Requires a number to specify the index to be displayed
                > Header row is line 0, entries starting at line 1.

          -h    Displays this help file in terminal
   or --help

      --count   Return a count of the headers and the number of line 
                 entries in the file 

    --headers   Returns the individual values for the headers of the file
  
    --entries   Returns the count of entries in the file

  **Parameters**

    [number]    A numerical value that is required for the 'i' and 'e' 
                commands
                > If a non-integer is entered, it will be rounded down to 
                an integer.
                > Only the last numerical value entered on the line will 
                be used

    [filename]  Must include the relative path and file extension '.csv' 
                or the program will return an 'invalid argument' error.



DESC
    puts help_display

end
