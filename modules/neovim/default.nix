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
      alacritty
      fd
      lazygit
      nerdfonts
      ripgrep
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
