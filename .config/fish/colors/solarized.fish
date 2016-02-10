# http://ethanschoonover.com/solarized#the-values

# Use these settings if you've applied a Solarized theme to your terminal (for
# example, if "ls -G" produces Solarized output). i.e. if "blue" is #268bd2, not
# whatever the default is. (See "../etc/Solarized Dark.terminal" for OS X.)

set -g base03  "--bold black"
set -g base02  "black"
set -g base01  "--bold green"
set -g base00  "--bold yellow"
set -g base0   "--bold blue"
set -g base1   "--bold cyan"
set -g base2   "white"
set -g base3   "--bold white"
set -g yellow  "yellow"
set -g orange  "--bold red"
set -g red     "red"
set -g magenta "magenta"
set -g violet  "--bold magenta"
set -g blue    "blue"
set -g cyan    "cyan"
set -g green   "green"

# Use these settings if your terminal supports term256 and your terminal hasn't
# been configured with a Solarized theme.i.e. if "blue" is the default blue, not
# Solarized blue.
#
set -g base03  002b36
set -g base02  073642
set -g base01  586e75
set -g base00  657b83
set -g base0   839496
set -g base1   93a1a1
set -g base2   eee8d5
set -g base3   fdf6e3
set -g yellow  b58900
set -g orange  cb4b16
set -g red     dc322f
set -g magenta d33682
set -g violet  6c71c4
set -g blue    268bd2
set -g cyan    2aa198
set -g green   859900

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_normal      $base0
set -g fish_color_command     $base0
set -g fish_color_quote       $cyan
set -g fish_color_redirection $base0
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $blue
set -g fish_color_comment     $base01
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base02"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan

# Used by fish_prompt

set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green
