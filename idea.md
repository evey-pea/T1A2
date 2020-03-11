# Terminal CSV Reader and Editor

## Features

- **Reads** CSV files with headers to the screen
  - Can be displayed as a list or as individual entries
  - Uses key inputs to navigate the output
- Has a default **settings** configuration that allow for how many lines are displayed at a time
  - Settings have editable defaults
  - Settings can be overridden with arguments entered on program initialising through the command line
- Can **edit** entries (in single entry view mode) and allow the user to **save** to back to original file or create a new file

## Gems used

| Gem                  | Purpose                                                           |
| :------------------- | :---------------------------------------------------------------- |
| Pastel (TTY Toolkit) | Provides simplified colorisation of on screen elements            |
| Smarter CSV          | Read and write CSV as hashes (expands on built-in CSV Class)      |
| TTY-Config           | Reads, writes and edits confirguration files                      |
| TTY-Reader           | Captures user keystrokes for controlling/manipulating the display |

## 
