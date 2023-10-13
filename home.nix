{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/justin";
    stateVersion = "23.05";
    username = "justin";
  };
  programs = {
    home-manager.enable = true;
  };
}
