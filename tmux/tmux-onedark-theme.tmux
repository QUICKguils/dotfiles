#!/usr/bin/env bash

# Tiré de: https://github.com/odedlaz/tmux-onedark-theme

od_black="#282c34"
od_blue="#61afef"
od_yellow="#e5c07b"
od_red="#e06c75"
od_white="#aab2bf"
od_green="#98c379"
od_visual_grey="#3e4452"
od_comment_grey="#5c6370"
od_cursor_grey="#2c323c"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$od_white"
set "message-bg" "$od_black"

set "message-command-fg" "$od_white"
set "message-command-bg" "$od_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$od_cursor_grey"
setw "window-status-bg" "$od_cursor_grey"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$od_cursor_grey"
setw "window-status-activity-fg" "$od_cursor_grey"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$od_comment_grey"
set "window-active-style" "fg=$od_white"

set "pane-border-fg" "$od_white"
set "pane-border-bg" "$od_black"
set "pane-active-border-fg" "$od_green"
set "pane-active-border-bg" "$od_cursor_grey"

set "display-panes-active-colour" "$od_yellow"
set "display-panes-colour" "$od_blue"

set "status-bg" "$od_cursor_grey"
set "status-fg" "$od_white"

set "@prefix_highlight_fg" "$od_black"
set "@prefix_highlight_bg" "$od_green"
set "@prefix_highlight_copy_mode_attr" "fg=$od_black,bg=$od_green"
set "@prefix_highlight_output_prefix" "│"

status_widgets=$(get "@od_widgets")
time_format=$(get "@od_time_format" "%R")
date_format=$(get "@od_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$od_white,bg=$od_visual_grey,nounderscore,noitalics] #h #[fg=$od_black,bg=$od_white] ${time_format} "
set "status-left" "#[fg=$od_black,bg=$od_white,bold] #S "

set "window-status-format" " #[fg=$od_white,bg=$od_visual_grey] #I │ #W #[bg=$od_cursor_grey]"
set "window-status-current-format" " #[fg=$od_black,bg=$od_blue,nobold] #I │ #W #[bg=$od_cursor_grey]"
