# VSCodium Configuration

This repository contains my personal configuration for [VSCodium](https://vscodium.com/), the open-source build of Visual Studio Code. It includes user settings, keybindings, code snippets, and a list of recommended extensions to quickly set up a consistent development environment across machines.

## Structure

```
vscodiumconf/
├── settings/           # User settings, keybindings, and code snippets
│   ├── settings.json
│   ├── keybindings.json
│   └── snippets/
├── extensions/         # List of extensions to install
│   └── extensions.list
├── themes/             # (Optional) Custom themes
├── scripts/            # Setup and automation scripts
│   └── setup.sh
└── README.md           # This file
```

## Installation

### 1. Clone this repository
```sh
git clone https://github.com/<your-username>/vscodiumconf.git
cd vscodiumconf
```

### 2. Run the setup script

#### On Arch Linux (and derivatives)
The script will check if VSCodium is installed. If not, it will install it using `yay` (make sure you have yay installed). It will then copy the configuration files to the appropriate directories and install the listed extensions.

```sh
bash scripts/setup.sh
```

#### On Other Linux Distributions
- Install VSCodium manually: https://vscodium.com/#install
- Copy the contents of `settings/` and `settings/snippets/` to your VSCodium user directory, usually `~/.config/VSCodium/User/`.
- Install extensions manually or use the list in `extensions/extensions.list`:
  ```sh
  cat extensions/extensions.list | xargs -L 1 codium --install-extension
  ```

## Notes
- The setup script is tailored for Arch Linux and derivatives. For other distributions, adjust the installation steps as needed.
- You can customize the settings, keybindings, and snippets to your liking.

---

Feel free to fork and adapt this configuration for your own workflow! 