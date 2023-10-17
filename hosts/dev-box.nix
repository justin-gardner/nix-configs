{...}: {
  home.homeDirectory = "/home/ubuntu";
  home.username = "ubuntu";

  imports = [./common.nix];
}
