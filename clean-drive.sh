#!/bin/bash

# Check if at least one argument was provided
if [ -z "$1" ]; then
    echo "Error: Please provide both a drive and a loop count as arguments."
    exit 1
fi

drive="$1"
loop_count="${2:-1}"
echo "Starting Drive Clean for drive $drive with $loop_count loops"

# Run BleachBit to clear the disk
/mnt/c/Program\ Files\ \(x86\)/BleachBit/bleachbit_console.exe -w "$drive":

# If not specified, skip running SDelete and Cipher
if [ -z "$3" ]; then
    echo "Not running sdelete Clear"
else
    # Run SDelete
    echo "running sdelete clear"
    /mnt/c/Program\ Files\ \(x86\)/BleachBit/sdelete.exe -c "$drive":
fi

# If not specified, skip Cipher
if [ -z "$3" ]; then
    echo "Not running Cipher"
else
    echo "Running Cipher"
    /mnt/c/Program\ Files\ \(x86\)/BleachBit/cipher.exe /W:"$drive":
fi

# Zero out the swapfile
truncate -s 0 "/mnt/$drive/swapfile.bin"

echo "Zero out Drive"

cat /dev/zero > "/mnt/$drive/swapfile.bin"
sync
sleep 10s

truncate -s 0 "/mnt/$drive/swapfile.bin"
sleep 10s

rm -f "/mnt/$drive/swapfile.bin"
