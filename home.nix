{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/justin";
    username = "justin";
    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
