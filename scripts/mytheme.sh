#!/usr/bin/env bash

# A tmux color scheme
# https://jonasjacek.github.io/colors/
# https://gist.githubusercontent.com/hoov/3147229/raw/4262e4975e322a31c83f0551238e582d6a5f3cfb/colortrans.py

main()
{
  # set current directory variable
  current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  # color Pallette
  white='colour231'
  white_grey='colour254'
  gray='colour239'
  dark_gray='#282a36'
  light_purple='colour141'
  dark_purple="colour61"
  cyan='colour117'
  green='colour84'
  orange='colour215'
  red='colour203'
  pink='colour212'
  yellow='colour228'

  # status bar genral configuration
  tmux set -g status-justify "left"
  tmux set -g status-style "bg=${dark_gray},fg=${white_grey}"

  # status bar left section configuration
  tmux set -g status-left-style "fg=${white_grey}"
  tmux set -g status-left "#S  "
  # status bar right section configuration
  tmux set -g status-right "#[fg=colour250,bg=colour240] %H:%M #[fg=colour241,bg=colour252] #h "

  # status bar window section configuration
  tmux setw -g window-status-current-style "bg=${pink},fg=${white}"
  tmux setw -g window-status-last-style "bg=${gray},fg=${white_grey}"
  tmux setw -g window-status-format "#{?window_zoomed_flag,#[fg=${light_purple}],} #I┊#W "
  tmux setw -g window-status-current-format "#{?window_zoomed_flag,#[bg=${dark_purple}],} #I┊#W "
  tmux setw -g window-status-separator ""

}

# run main function
main
