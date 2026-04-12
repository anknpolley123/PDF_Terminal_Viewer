#!/bin/bash

# Author: Ankon Polley
# Link: https://github.com/anknpolley123
# Description: Full dependency installer for pdfreader

TOOL_NAME="pdfreader"

echo "------------------------------------------------"
echo "   $TOOL_NAME - Full Environment Setup"
echo "   Author: Ankon Polley"
echo "------------------------------------------------"

# 1. Update package lists
echo "[*] Updating repositories..."
sudo apt update -y

# 2. Install every required dependency
# Includes: PDF conversion, Coloring, OCR Engine, Bengali Language, and Python tools
echo "[*] Installing all dependencies (this may take a minute)..."
sudo apt install -y poppler-utils \
                    lolcat \
                    ocrmypdf \
                    tesseract-ocr \
                    tesseract-ocr-ben \
                    ruby \
                    python3-pip

# 3. Fix Path Issues (The most common error)
echo "[*] Configuring binary paths..."
# Fix for lolcat in /usr/games
if [ -f /usr/games/lolcat ]; then
    sudo ln -sf /usr/games/lolcat /usr/bin/lolcat
fi

# Ensure /usr/games is in the PATH for the current session
export PATH=$PATH:/usr/games

# 4. Verify Installations
echo "[*] Verifying components..."
if command -v pdftotext >/dev/null && command -v lolcat >/dev/null; then
    echo "[+] Core dependencies: OK"
else
    echo "[!] Warning: Some core tools missing. Checking Ruby gems..."
    sudo gem install lolcat
fi

# 5. Set Permissions
if [ -f pdfreader.sh ]; then
    chmod +x pdfreader.sh
    echo "[+] pdfreader.sh is ready for use."
else
    echo "[!] Error: pdfreader.sh not found in this directory!"
fi

echo "------------------------------------------------"
echo "   SETUP COMPLETE!"
echo "   You can now view PDFs in color using:"
echo "   ./pdfreader.sh <filename.pdf>"
echo "------------------------------------------------"
