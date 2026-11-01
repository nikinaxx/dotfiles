{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;               # also sets pane-base-index
    mouse = true;
    terminal = "tmux-256color";
    clock24 = true;              # tmux default; the module would otherwise force 12h
    secureSocket = false;        # keep the socket in /tmp like now, so running sessions stay visible

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;   # v2.1.3
        extraConfig = ''
          set -g @catppuccin_flavor 'mocha'
          set -g @catppuccin_status_background "#1f1f1f"
          set -g @catppuccin_window_text " #W"
          set -g @catppuccin_window_current_text " #W"
          set -g @catppuccin_window_current_number_color "#{@thm_blue}"
          set -g @catppuccin_session_color "#{?client_prefix,#{E:@thm_red},#{E:@thm_blue}}"
          set -g window-status-current-style default
          set -g window-status-separator ""
        '';
      }
    ];

    extraConfig = ''
      set -g renumber-windows on

      # terminal title
      set -g set-titles on
      set -g set-titles-string "Terminal"

      # Alt+1/2/3 to switch windows
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3

      # true colour
      set -ga terminal-overrides ",*:Tc"

      # yazi image previews
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      # two-line status bar: bar on top, blank spacer line under it
      # (unset first so reloads start from the default formats)
      set -gu status-format
      set -g status 2
      set -g 'status-format[1]' ""
      set -g status-position top

      set -g status-left "#{E:@catppuccin_status_session}"
      set -g status-left-length 50

      set -g status-right-length 100
      set -g status-right "#[fg=#{@thm_fg},bg=#{@thm_surface_0}] #{pane_current_command} #[fg=#{@thm_crust},bg=#{@thm_blue}]  #[fg=#{@thm_blue},bg=default]"
    '';
  };
}
