#!/usr/bin/env bash
RED="\e[31m"
ENDCOLOR="\e[0m"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
echo -e "Add nvim to your path like export ${RED}PATH=\"\$PATH:/opt/nvim-linux-x86_64/bin\"${ENDCOLOR}"
echo -e "Install depenencies ${RED}sudo apt install luarocks fd-find ripgrep${ENDCOLOR}"
echo -e "Install depenencies ${RED}sudo nala install luarocks fd-find ripgrep${ENDCOLOR}"
