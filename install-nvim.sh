#!/usr/bin/env bash
RED="\e[31m"
ENDCOLOR="\e[0m"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
echo -e "Add nvim to your path like export ${RED}PATH=\"\$PATH:/opt/nvim-linux64/bin\"${ENDCOLOR}"
