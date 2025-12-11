#!/usr/bin/env bash
RED="\e[1;41m"
ENDCOLOR="\e[0m"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
if [ -f nvim-linux-x86_64.tar.gz ]; then
    sudo rm -rf /opt/nvim-linux-x86_64
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
	# Only show PATH hint if /opt/nvim-linux-x86_64/bin is not already in PATH
	if ! echo "$PATH" | /bin/grep -Eq '(^|:)/opt/nvim-linux-x86_64/bin($|:)'; then
		echo -e "Added nvim to your path like ${RED}PATH=\"\$PATH:/opt/nvim-linux-x86_64/bin\"${ENDCOLOR}"
	fi

	# Only show install instructions if any of the required tools are missing
	missing=()
	command_exists() { command -v "$1" >/dev/null 2>&1; }

	if ! command_exists luarocks; then
		missing+=("luarocks")
	fi
	# fd can be provided as 'fd' or 'fdfind' depending on distro
	if ! command_exists fd && ! command_exists fdfind; then
		missing+=("fd-find")
	fi
	if ! command_exists rg; then
		missing+=("ripgrep")
	fi

	if [ ${#missing[@]} -gt 0 ]; then
		echo -e "Install dependencies with apt  ${RED}sudo apt install ${missing[*]}${ENDCOLOR}"
		echo -e "Install dependencies with nala ${RED}sudo nala install ${missing[*]}${ENDCOLOR}"
	fi
else
    echo "Download failed"
fi
