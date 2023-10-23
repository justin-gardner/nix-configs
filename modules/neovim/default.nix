{pkgs, ...}: {
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    extraLuaConfig = ''
      ${builtins.readFile config/autocmds.lua}
      ${builtins.readFile config/keymaps.lua}
      ${builtins.readFile config/lazy.lua}
      ${builtins.readFile config/options.lua}
    '';
    extraPackages = with pkgs; [
      nerdfonts
      lazygit
      ripgrep
      fd
      alacritty
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
