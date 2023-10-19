{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/fish
    ../modules/git
    ../modules/neovim
    ../modules/tmux
  ];
  home = {
    stateVersion = "23.05";
  };
  programs = {
    exa.enable = true;
    home-manager.enable = true;
    ripgrep.enable = true;
  };
}
