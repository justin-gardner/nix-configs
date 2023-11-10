{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # generic
      alias ll='exa -al --color=always --group-directories-first --icons'
      alias ls='exa -l --color=always --group-directories-first --icons'
      alias mkdir='mkdir -p'

      # git-related
      alias g='git'
      alias git-rm-branches='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main\|develop\|development" | xargs git branch -D'
      alias cleanpush='/bin/bash ~/nix-configs/git-scripts/cleanpush'
      alias rebase='/bin/bash ~/nix-configs/git-scripts/rebase'

      # home-manager
      alias hmd='cd ~/nix-configs'
      alias hms-dev='home-manager switch --flake ~/nix-configs#dev'
      alias hms-home='home-manager switch --flake ~/nix-configs#home'
      alias hms-work='home-manager switch --flake ~/nix-configs#work'
      alias hmu='nix flake update ~/nix-configs/'

      set fish_greeting
      clear
    '';
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "pure-fish";
          repo = "pure";
          rev = "f1b2c7049de3f5cb45e29c57a6efef005e3d03ff";
          sha256 = "sha256-MnlqKRmMNVp6g9tet8sr5Vd8LmJAbZqLIGoDE5rlu8E";
        };
      }
    ];
  };
}
