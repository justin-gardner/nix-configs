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
    home-manager.enable = true;
    ripgrep.enable = true;
  };
}
