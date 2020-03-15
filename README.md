# Terminal Application Reader/Editor for CSV (tare-csv)

- Terminal Application Reader/Editor for CSV (tare-csv)
  - Statement of Purpose
  - Use case indentification
    - Basic Usage Example
  - Features
    - Reading Data Implementation
    - Editing Entries
  - Terminal commands
  - Installation
    - Prerequisites
    - Ruby Gem Dependencies
    - Installing 'tare-csv'
  - Disclaimer

## Statement of Purpose

The application allows for the reading and editing of CSV files via a command prompt when a GUI program is not suitable or available to do so. It reads out (either in part or in full) the contents of the file to the screen. The user can also nominate a singular line to edit.

## Use case indentification

In some instances such as a remotely logging into a machine or server via a tty terminal client, a CSV data file may need to have its contents examined and/or edited.

Limitations faced by user include and are not limited to...

- the size of some data files being excessively large to edit via a terminal editor
- headers of the document data being at the top line of the file and leaving the field of view
- seperators of the data fields being commas and being less than human readable across multiple lines

This application addresses these problems by allowing the file's contents to displayed as a line by line output stream in the terminal.

Primarily the application is a light weight solution aimed at data server admins and developers who need to carry out data admin tasks for troubleshooting and debugging whilst keeping the interface lean and within a terminal window.

### Basic Usage Example

- Once at the file's location on the target machine, the user can access it with the command  
  ```tare-csv.rb [filename].csv```  
- Upon loading the file, the terminal will display a message that the file has been parsed successfully in to the application along with a count of the headers and of the number of entries in the file
- The user is then supplied with a list of available commands under the output with a prompt to select the one of the options
- Once the user is finished with the application, the application can be exited and return to the previous terminal location

## Features

The two main feature of tare-csv are that it can both read and edit lines in a csv file.

- **Reads** CSV files with headers to the screen
  - Entries can be displayed as either a list or as individual entries
- Can **edit** entries (in single entry view mode) and allow the user to **save** to back to original file

### Reading Data Implementation

The data object views are:

- Multiple line entry view
  - for displaying as a list of data with headers
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
4. The user will then be provided with the list of fields with the output reflecting the changes made
5. Once the  the last hash key of the entry has reached, the user will be prompted  
   - to confirm the changes  
   - or exit without changing the entry

## Terminal commands

There are several options that return information about the csv file to the terminal. Each of these terminal commands are only to be used on their own.

| Command                  | Description                                                                                             |
| :----------------------- | :------------------------------------------------------------------------------------------------------ |
| ```--count```            | Return a count of the headers and the number of line entries in the file                                |
| ```--headers```          | Returns the individual values for the headers of the file                                               |
| ```--entries```          | Returns the count of entries in the file                                                                |
| ```-a```                 | Prints all entries to the screen (not recommended for large datasets)                 |
| ```-i```                 | Prints a specified index to the screen with file headers as keys                                        |
| ```-e```                 | Edit mode. User must list an entry number to edit.<br>Header row is line 0, entries starting at line 1. |
| ```-h``` or ```--help``` | Displays help file in terminal                                                                          |

## Installation

### Prerequisites

The following software is required to install and run this program:

- A bash terminal
- Ruby (preferably version 2.6.3 as this was the version used to test the application)
- Git
- The Ruby gems listed in the depencies table below

Addititonally, if you wish to make the program executable, you will need to know where your Ruby language executables are loacted on your machine

### Ruby Gem Dependencies

| Gem                                                           | Purpose                                                           |
| :------------------------------------------------------------ | :---------------------------------------------------------------- |
| [Pastel (TTY Toolkit)](https://github.com/piotrmurach/pastel) | Provides simplified colorisation of on screen elements            |
| [TTY-Reader](https://github.com/piotrmurach/tty-reader)       | Captures user keystrokes for controlling/manipulating the display |
| [TTY-Table](https://github.com/piotrmurach/tty-table)         | Displays output as a table in terminal                            |

### Installing 'tare-csv'

Once the prerequisites above have been installed, the program can be installed with the following steps

1. From your bash terminal, clone this repository from github  
     ```$ git clone https://github.com/evey-pea/T1A2.git```  
     - Alternatively, download the program as a zip file from github at [this repository](https://github.com/evey-pea/T1A2) and unzip it
2. Locate the file 'tare-csv.rb' within your either your cloned repository or unpacked files
3. Edit the first line in the file starting with '#!/usr/bin/ruby env' to relfect where your Ruby exectutables are located
4. At the command prompt, make the script executable  
     ```$ chmod +x tare-csv.rb```

To test if it has been installed correctly, at the terminal try accessing the built-in help file with either  

- ```tare-csv.rb -h```  

or  

- ```tare-csv.rb --help```

## Disclaimer

As this code base is the result of a student assignment, care must be undertaken by the user to determine if this application is suitable for both their needs and their individual installation. I accept no liability nor do I offer any support for this codebase at this point in time.

**All users, regardless of experience level are urged to use caution and common sense when implementing this application.**

I do welcome feedback and also make the code freely available to anyone who wishes to modify it, however I will not be accepting feature requests as my time is limited.
