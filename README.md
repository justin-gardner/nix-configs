# My Home Manager Configuration

This repository contains all my Home Manager configuration files and other supporting files.  This allows me to manage my dotfiles and user environment easily, while keeping everything in sync across all systems.

## Prerequisites

Before you can use this configuration, you need to install Nix and Home Manager, then enable flake support.

### Installing Nix
Nix package manager is used to manage to core of this setup.  If you do not have it already installed, do that first. Follow the installation guide [here.](https://nixos.org/download.html)

### Installing Home Manager
Once Nix is installed, you can install Home Manager. Home Manager is a Nix module that allows you to manage user-specific packages and configurations. To install it, run the following command:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

For more information, or in case things have changed or if the above does not work for you, see the [documentation.](https://nix-community.github.io/home-manager/index.html)

### Enabling Flakes
In the installation guide for Home Manager, it explains how to enable flakes, but the tldr is: `echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf` and then restart the `nix-daemon` service.


## Usage

Now that you have Nix and Home Manager installed, you can use this repository to set up your user environment.

### Clone this Repository
Clone this repository into your home directory

```bash
git clone https://github.com/justin-gardner/nix-configs.git ~/
```

### Change Some Variables
There are a few things you will need to change to get this working:

- Update `modules/git/default.nix` to use your own Git credentials.
- Either change one of the system-specific files in the `hosts/` directory or use one of those as a guideline in creating your own file.
  - If you create a new file, you'll need to create a new section and import the new file in the `flake.nix` file and then add a new alias in the `modules/fish/default.nix` file to use that config.

### Activate the Configuration
Run the following command to evaluate the configuration and create a user environment (change {system} to the name you set in flake.nix for your system):

```bash
home-manager switch --flake ~/nix-configs#{system}
```

You will likely need to close your terminal and reopen it for everything to update.  If you change any of the configurations, you can reload them by rerunning the above command, or the corresponding `hms` alias.
