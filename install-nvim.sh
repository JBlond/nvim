#!/usr/bin/env bash
RED="\e[1;41m"
ENDCOLOR="\e[0m"

# Function to compare two versions

version_gt() {
  [ "$1" != "$2" ] && [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | tail -n 1)" = "$1" ]
}

# Welche Architektur (Raspberry Pi: aarch64)
arch="$(uname -m)"
case "$arch" in
  x86_64|amd64)
    nvim_pkg="nvim-linux-x86_64.tar.gz"
    nvim_dir="nvim-linux-x86_64"
    ;;
  aarch64|arm64)
    nvim_pkg="nvim-linux-arm64.tar.gz"
    nvim_dir="nvim-linux-arm64"
    ;;
  *)
    echo "Unbekannte Architektur: $arch"
    exit 1
    ;;
esac

# Get the installed nvim version (strip "NVIM" prefix and extract version)
installed_version=$(nvim --version 2>/dev/null | head -n 1 | sed -E 's/.*v?([0-9]+\.[0-9]+\.[0-9]+).*/\1/')

# Retrieve the latest version from Neovim releases
latest_version=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name":' | sed -E 's/.*"v?([^"]+)".*/\1/')

echo "Installed version: $installed_version"
echo "Latest version: $latest_version"

# Check if the installed version is up-to-date
if [ -z "$installed_version" ] || version_gt "$latest_version" "$installed_version"; then
  echo "Updating Neovim to version $latest_version..."

  # Download and install the latest version
  url="https://github.com/neovim/neovim/releases/latest/download/${nvim_pkg}"
  curl -LO "$url"

  if [ -f "$nvim_pkg" ]; then
    sudo rm -rf "/opt/$nvim_dir"
    sudo tar -C /opt -xzf "$nvim_pkg"
    rm "$nvim_pkg"

      # Only show PATH hint if /opt/<dir>/bin is not already in PATH
      if ! echo "$PATH" | grep -Eq "(^|:)/opt/${nvim_dir}/bin($|:)"; then
        echo -e "Add nvim to your path like ${RED}PATH=\"\$PATH:/opt/${nvim_dir}/bin\"${ENDCOLOR}"
      fi

      # Check for missing dependencies
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
else
  echo "You already have the latest version of Neovim ($installed_version). No update needed."
fi
