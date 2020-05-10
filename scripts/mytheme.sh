#!/usr/bin/env bash

# A tmux color scheme
# https://jonasjacek.github.io/colors/
# https://gist.githubusercontent.com/hoov/3147229/raw/4262e4975e322a31c83f0551238e582d6a5f3cfb/colortrans.py

main() {
  # set current directory variable
  current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  # color Pallette
  white='colour231'
  white_gray='colour254'
  gray='colour239'
  d_gray='#282a36'
  l_purple='colour141'
  d_purple="colour61"
  cyan='colour117'
  green='colour84'
  orange='colour215'
  red='colour203'
  pink='colour212'
  yellow='colour228'

  # status bar genral configuration
  tmux set -g status-justify "left"
  tmux set -g status-style "fg=${white_gray}"
  tmux set -g status-position top
  # status bar left/right configuration
  tmux set -g status-left-style "fg=${white_gray}"
  tmux set -g status-right "#[fg=colour250,bg=colour240] %H:%M #[fg=colour241,bg=colour252] #h "
  # status bar window section configuration
  tmux setw -g window-status-current-style "bg=${pink},fg=${white}"
  tmux setw -g window-status-last-style "bg=${gray},fg=${white_gray}"
  tmux setw -g window-status-format "#{?window_zoomed_flag,#[fg=${l_purple}],}  #I┊#W  "
  tmux setw -g window-status-current-format "#{?window_zoomed_flag,#[bg=${d_purple}],}  #I┊#W  "
  tmux setw -g window-status-separator ""

  # panes
  tmux setw -g pane-border-status bottom
  pane_index="#{?pane_active,#[bg=${pink}#,fg=${white}],#[bg=${gray}#,fg=${white_gray}]} #P #[bg=default,fg=default]"
  pane_title="#(sh tmux-hostname.sh --pane-title=#{pane_title})"
  pane_git="#(sh ~/.bin/tmux-radar.sh  --pane-current-path=#{pane_current_path} --pane-active=#{pane_active})"
  tmux setw -g pane-border-format "  ${pane_index}${pane_title} · #{pane_current_command}${pane_git} "
  tmux set -g pane-active-border-style 'fg=colour252'
  tmux set -g pane-border-style 'fg=colour239'

  # sets style for the non-default status-lines
  tmux set -g status 2
  tmux set -g status-format[1] ''
}

# run main function
main
