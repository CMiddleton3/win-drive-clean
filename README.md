# Disk Cleaning Script

## Usage

This script is designed to clean a disk by running several security tools in sequence.

### Prerequisites

- **BleachBit**: Ensure BleachBit is installed on your system.
- **sdelete.exe** and **cipher.exe**: These are external programs that need to be located in the specified directories.

### Steps to Run

1. Open a terminal or command prompt.
2. Navigate to the directory containing this script (`clean_disk.sh`).
3. Execute the script with two arguments:
   ```bash
   ./clean_disk.sh /path/to/drive /loop_count [optional sdelete_clear]
