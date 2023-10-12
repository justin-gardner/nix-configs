{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # generic
      alias ls='exa -al --color=always --group-directories-first --icons'
      alias ll='exa -l --color=always --group-directories-first --icons'
      alias mkdir='mkdir -p'

      # git-related
      alias g='git'
      alias git-rm-branches='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main\|develop\|development" | xargs git branch -D'
      alias cleanpush='/bin/sh ~/git_scripts/cleanpush'
      alias rebase='/bin/sh ~/git_scripts/rebase'

      # home-manager
      alias hmd='cd ~/dot_files/nix/home-manager'
      alias hms='home-manager switch --flake ~/dot_files/nix/home-manager#justin'
      alias hmu='nix flake update ~/dot_files/nix/home-manager && hms'
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
