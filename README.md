# Dotfiles

Personal configuration files for my Linux setup.

## Included

* **Neovim**
* **Kitty**
* **Fastfetch**

## Installation

Clone the repository:

```bash
git clone https://github.com/Rihash18/dotfiles.git
cd dotfiles
```

Make the installer executable and run it:

```bash
chmod +x install.sh
./install.sh
```

The installer lets you choose which configuration to install.

## Backup

If an existing configuration is detected, it is backed up before the new one is installed.

Example:

```text
~/.config/nvim      → ~/.config/nvim.bak
~/.config/kitty     → ~/.config/kitty.bak
~/.config/fastfetch → ~/.config/fastfetch.bak
```

## Repository Structure

```text
.
├── install.sh
├── nvim/
├── kitty/
└── fastfetch/
```

## Requirements

* Linux
* Bash
* Existing `~/.config` directory

## License

This project is available under the MIT License.
