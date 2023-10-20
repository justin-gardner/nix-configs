{...}: {
  programs.tmux = {
    clock24 = true;
    enable = true;
    extraConfig = ''
      set-option -g default-shell ~/.nix-profile/bin/fish
      set-option -sa terminal-overrides ",xterm*:Tc"

      # change prefix to C-a
      set -g prefix C-a
      unbind C-b
      bind C-a send-prefix

      # split panes
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # pane traversal
      bind -n M-Left select-pane -L
      bind -n M-Down select-pane -D
      bind -n M-Up select-pane -U
      bind -n M-Right select-pane -R

      # pane resizing
      bind -r h resize-pane -L 5
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r n resize-pane -Z # maximize

      # enable mouse support
      set -g mouse on

      # start windows at 1 instead of 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set -sg escape-time 10
    '';
  };
}
