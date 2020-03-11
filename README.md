# Terminal Application Reader/Editor for CSV (tare-csv)

## Statement of Purpose

The application allows for the reading and editing of CSV files via a command prompt when a GUI program is not suitable or available to do so. It reads out the contents of the file to the screen and the user then nominates a line to edit.

### Use case indentification

In some instances such as a remotely logging into a machine or server via a tty terminal client, a CSV data file may need to have its contents examined and/or edited.

Limitations faced by user include and are not limited to...

- the size of some data files being excessively large to edit via a terminal editor
- headers of the document data being at the top line of the file and leaving the field of view
- seperators of the data fields being commas and being less than human readable across multiple lines

This application addresses these problems by allowing the file's contents to displayed as a line by line output stream in the terminal with a prompt at the bottom for the user to issue addtional munipulation commands.

Primarily the application is a light weight solution aimed at data server admins and developers who need to carry out data admin tasks for troubleshooting and debugging whilst keeping the interface lean and within a terminal window.

### Basic Usage Example

- Once at the file's location on the target machine, the user can access it with the command ```tare-csv [filename].csv```
- Upon loading the file, the terminal will display a message that the file has been parsed successfully in to the application along with a count of the headers and of the number of entries in the file
- The user is then supplied with a list of available commands under the output with a prompt to select the one of the options
- Once the user is finished with the application, the application can be exited and return to the previous terminal location

## Features

- **Reads** CSV files with headers to the screen
  - Entries can be displayed as either a list or as individual entries
- Can **edit** entries (in single entry view mode) and allow the user to **save** to back to original file or create a new file
- Has a default **settings** configuration that allow for how many lines are displayed at a time
  - Settings have editable defaults
  - Settings can be overridden with arguments entered on program initialising through the command line

### Reading Data Entries to the screen

Reading the entries to screen involves a moving stick algorithm that displays a set amount of entries at a time. This is because some data sets can be quite large. If the output is not restrained to smaller increments, the contents displayed could be more than the user's available terminal screen height and/or line limit. 

### Editing Entries

## Gems used

| Gem                  | Purpose                                                                                                                                      |
| :------------------- | :------------------------------------------------------------------------------------------------------------------------------------------- |
| Pastel (TTY Toolkit) | Provides simplified colorisation of on screen elements                                                                                       |
| Smarter CSV          | Read and write CSV as hashes (expands on built-in Ruby CSV Class)                                                                            |
| TTY-Config           | Reads, writes and edits confirguration files                                                                                                 |
| TTY-Reader           | Captures user keystrokes for controlling/manipulating the display                                                                            |
| TTY-Prompt           | Enables the selection of menu items                                                                                                          |
| TTY-Screen           | Used to obtain the user's terminal window size to prevent the amount of data being outputted being more than the user's terminal can display |

