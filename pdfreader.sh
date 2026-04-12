#!/bin/bash

# Author: Ankon Polley
# GitHub: https://github.com/anknpolley123
# Description: Launches a PDF file in the terminal with colored text output.

# Define colors for the UI
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Display Banner
echo -e "${CYAN}---------------------------------------"
echo -e "   PDF Terminal Viewer by Ankon Polley "
echo -e "   Link: https://github.com/anknpolley123"
echo -e "---------------------------------------${NC}"

# Check if a file was provided
if [ -z "$1" ]; then
    echo "Usage: ./launch_pdf.sh <filename.pdf>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Convert PDF to text and pipe it to lolcat for coloring
# The '-' tells pdftotext to output to stdout
pdftotext "$1" - | lolcat
