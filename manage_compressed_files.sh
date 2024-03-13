#!/bin/bash

# Check for root access
if [ "${UID}" -ne 0 ]; then
    echo 'Please run with sudo or root.'
    exit 1
fi

# Function for creating compressed files
function create_compressed_files {
    read -p "Enter the folder path you want to compress: " folder_path

    echo "Choose compression format:"
    echo "z) gzip (.gz)"
    echo "j) bzip2 (.bz2)"
    echo "J) xz (.xz)"
    read -p "Enter your choice (z/j/J): " compression_format

    case $compression_format in
        z)
            tar -czvf "${folder_path}.tar.gz" "$folder_path"
            ;;
        j)
            tar -cjvf "${folder_path}.tar.bz2" "$folder_path"
            ;;
        J)
            tar -cJvf "${folder_path}.tar.xz" "$folder_path"
            ;;
        *)
            echo "Invalid compression format choice!"
            ;;
    esac
}

# Function for extracting compressed files
function extract_compressed_file {
    read -p "Enter the full path of the compressed file: " compressed_file_path
    tar -xf "$compressed_file_path"
}

# Function for listing compressed files
function list_compressed_files {
    echo "Listing compressed files:"
    ls -l *.gz *.bz2 *.xz
}

# Function for displaying exit banner
function exit_banner {
    echo "Exiting manage_compressed_files.sh. Goodbye!"
}

# Main script
while true; do
    echo "Choose an option:"
    echo "1) Create compressed files"
    echo "2) Extract compressed file"
    echo "3) List compressed files"
    echo "4) Exit"
    read -p "Enter your choice (1/2/3/4): " choice

    case $choice in
        1)
            create_compressed_files
            ;;
        2)
            extract_compressed_file
            ;;
        3)
            list_compressed_files
            ;;
        4)
            exit_banner
            exit 0
            ;;
        *)
            echo "Invalid choice! Please choose a valid option."
            ;;
    esac
done

