# Terminal Application Reader/Editor for CSV (tare-csv)

## Statement of Purpose

***-- PLEASE NOTE --***
This application is still being built as part of an assignment from my bootcamp course. This github project is set to public so that I may get feedback from my peers in class and instructors.

If you can see this text, then the application is not yet ready.

***-- Please do not attempt to utilise it! --***

The application allows for the reading and editing of CSV files via a command prompt when a GUI program is not suitable or available to do so. It reads out the contents of the file to the screen and the user then nominates a line to edit.

## Use case indentification

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

### Reading Data Implementation

When reading these object views to the screen, a moving stick algorithm is used. This is because some data sets can be quite large. If the output is not restrained to smaller increments, the contents displayed could be more than the user's available terminal screen height and/or line limit.

The data from the CSV file is loaded via the Ruby gem [Smarter CSV](https://github.com/tilo/smarter_csv). The contents of the file are parsed into a hash object in memory. From this hash, the data can be manipulated to form different data object views within the program.

The data object views are

- Multiple line entry view
  - for displaying as a list of data with headers
  - for displaying entries with selected headers
- Single line entry view
  - for displaying a single entry to the screen with all of its fields with headers as labels
  - for editing a single line entry's value fields

### Editing Entries

Editing involves cycling through an iteration of the entry's hash.

1. Editing an entry is done by selecting the 'edit' command from the menu
2. Each key for the entry's hash will be provided with an individual prompt.
3. For value entry, either  
   - a new value can be entered at the blank prompt  
   - or the prompt can be left blank to accept the previously existing value.
4. Once the  the last hash key of the entry has reached, the user will be prompted  
   - to confirm the changes  
   - or exit without changing the entry
5. The user will then be provided with the previous list of entries with the output reflecting the changes made

### Selecting Header Data

If only the data from several headers required, the user can select the headers by using the 'headers' menu option in the full application.

This will load to the screen only the headers selected by the user and their respective hash values within the file for editing.

1. 'Headers' option is selected from the menu
2. Each header is displayed in it's own selection prompt
3. The user presses the space bar to toggle the selection and confirms by pressing 'Enter'
4. The User is then presented a list of selected headers and is asked to confirm the full selection before entry line data is read to the screen.

The number of entries displayed can be set either via the application configuration of by passing an argument at initialisation.

### Settings

Default settings are saved in a .yaml configruation file and can be set via the 'options' menu option

Available settings include:

- the number of headers to be concurrently displayed on screen and
- the number of entries outputted at a time
- the colour scheme of the applications

## Terminal commands

There are several options that return information about the file without loading the full application.

| Command       | Description                                                              |
| :------------ | :----------------------------------------------------------------------- |
| **--count**   | Return a count of the headers and the number of line entries in the file |
| **--headers** | Returns the individual values for the headers of the file                |
| **--entries** | Returns the count of entries in the file                                 |

The persistent settings can be overidden at the initilisation of the application by using the following arguments

| Argument | Description                                                                                                            |
| :------- | :--------------------------------------------------------------------------------------------------------------------- |
| ```-l``` | Sets the line display limit to the maximum screen height (minus the amount or lines required for the prompt interface) |
| ```-a``` | Prints all entries to the screen minus the headers (not recommended for large datasets)                                |
| ```-i``` | Prints a specified index to the screen with headers as keys                                                            |

## Ruby Gem Dependencies

| Gem                                                           | Purpose                                                                                                                                      |
| :------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------- |
| [Pastel (TTY Toolkit)](https://github.com/piotrmurach/pastel) | Provides simplified colorisation of on screen elements                                                                                       |
| [Smarter CSV](https://github.com/tilo/smarter_csv)            | Read and write CSV as hashes (expands on built-in Ruby CSV Class)                                                                            |
| [TTY-Config](https://github.com/piotrmurach/tty-config)       | Reads, writes and edits confirguration files                                                                                                 |
| [TTY-Reader](https://github.com/piotrmurach/tty-reader)       | Captures user keystrokes for controlling/manipulating the display                                                                            |
| [TTY-Prompt](https://github.com/piotrmurach/tty-prompt)       | Enables the selection of menu items                                                                                                          |
| [TTY-Screen](https://github.com/piotrmurach/tty-screen)       | Used to obtain the user's terminal window size to prevent the amount of data being outputted being more than the user's terminal can display |
