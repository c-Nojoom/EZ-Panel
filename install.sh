#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'

URL="https://github.com/c-Nojoom/EZ-Panel/releases/latest/download/EZ-Panel"

echo -e "${GREEN}[*] Downloading latest EZ-Panel...${NC}"

curl -fsL "$URL" -o /usr/local/bin/EZ-Panel

if [ ! -f /usr/local/bin/EZ-Panel ] || [ $(stat -c%s /usr/local/bin/EZ-Panel) -lt 1000 ]; then
    echo -e "\033[0;31m[!] Error: Could not download the file.\033[0m"
    echo -e "Make sure you have at least one Release published as 'Latest' in your GitHub repo."
    exit 1
fi

chmod +x /usr/local/bin/EZ-Panel
ln -sf /usr/local/bin/EZ-Panel /usr/local/bin/EZ-panel
ln -sf /usr/local/bin/EZ-Panel /usr/local/bin/ezpanel

echo -e "${GREEN}[*] Running EZ-Panel...${NC}"
PYTHONWARNINGS="ignore" /usr/local/bin/EZ-Panel </dev/tty
