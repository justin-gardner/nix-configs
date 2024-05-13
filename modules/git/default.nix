{...}: {
  programs.git = {
    aliases = {
      s = "status";
      co = "checkout";
      cob = "checkout -b";
      del = "branch -D";
      br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      save = "!git add -A && git commit -m 'chore: checkpoint'";
      undo = "reset HEAD~1 --mixed";
      res = "!git reset --hard";
      done = "!git push origin HEAD";
      lg = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
    };
    enable = true;
    extraConfig = {
      core.editor = "vim";
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
    };
    # [TODO] [CHANGE_ME] Use your own name and email
    userEmail = "github.frugally996@passmail.net";
    userName = "Justin Gardner";
  };
}
