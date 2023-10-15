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
There are a few variables you'll need to change (unless your name is also Justin).  You can find them by searching for [TODO] [CHANGE_ME]

### Activate the Configuration
Run the following command to evaluate the configuration and create a user environment (change justin to the name you set in flake.nix):

```bash
home-manager switch --flake ~/nix-configs#justin
```

You may need to close your terminal and reopen it for everything to update.  If you change any of the configurations, you can reload them by rerunning the above command, or the alias `hms`, which will do that for you.
