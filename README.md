# nvim

My neovim / nvim config

```bash
# Linux
git clone https://github.com/JBlond/nvim.git ~/.config/nvim
# windows
git clone -c core.autocrlf=false https://github.com/JBlond/nvim.git %userprofile%\AppData\Local\nvim\
```

![preview](assets/001.jpg)

## shortcuts

- `<space>w` fast save
- `<space>q` fast save + quit / close
- `<space>n` toggle relative line numbers
- `<ESC>` finish search highlighting
- `<CTRL>n` next buffer

## Plugins

### nvim-tree

- `<space>sf` Toggle nvim tree (sf = show files)
- `<space>jf` Jumpt to file

### Telescope

- `<space>he` Telescope help pages
- `<CTRL>p` find files
- `<CTRL>f` find inside the file
- `<ALT>f` find grep

### Plugin Management

```vim
:Lazy
```

## Linux install Neovim

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo apt install luarocks
```

add to path

```bash
export PATH="$PATH:/opt/nvim-linux64/bin"
```

## Windows neovim install

```powershell
winget install --id Microsoft.Powershell --source winget
winget install --id "Neovim.Neovim"
npm install -g neovim
winget install python3
winget install --id "BurntSushi.ripgrep.GNU"
winget install sharkdp.fd
winget install "Lua for Windows"
windet install DEVCOM.LuaJIT
```

### Install all nerd fonts

```powershell
git clone --depth 1 --single-branch https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh
```

## Linux external programms

```bash
sudo apt install fd-find ripgrep
```

## tmux

When using neovim within tmux the cursor will change when exiting tmux. To prevent that add this to your tmux.conf

```ini
# always use 256 colors
set -g default-terminal 'tmux-256color'
# this is for 256 color
set -ga terminal-overrides ',*:Tc'
# this is for the cursor shape. 3 = blinking underscore. 1 would be a solid block
set -ga terminal-overrides '*:Ss=\E[%p3%d q:Se=\E[ q'
```
