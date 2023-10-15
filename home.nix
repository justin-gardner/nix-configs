{
  config,
  pkgs,
  ...
}: {
  home = {
    # [TODO] [CHANGE_ME] update this to be the absolute path to your home directory
    homeDirectory = "/home/justin";
    stateVersion = "23.05";

    # [TODO] [CHANGE_ME] change justin to your username
    username = "justin";
  };
  programs = {
    home-manager.enable = true;
  };
}
