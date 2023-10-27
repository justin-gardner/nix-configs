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
      printf "%s\n" 3 1 2 1 1 1 4 3 1 1 2 2 2 y | tide configure
      clear
    '';
    plugins = [
      {
        name = "Tide";
        src = pkgs.fetchFromGitHub {
          owner = "IlanCosman";
          repo = "tide";
          rev = "7f9d24de000a5f8ad68f738207187a36ecbb87c9";
          sha256 = "sha256-bSqFyrCa72s1rfwGOzOj033VbonxOkVDm9eUePRCSmA=";
        };
      }
    ];
  };
}
