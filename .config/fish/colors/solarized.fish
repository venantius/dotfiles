# http://ethanschoonover.com/solarized#the-values

# Use these settings if you've applied a Solarized theme to your terminal (for
# example, if "ls -x" produces Solarized output). i.e. if "blue" is #268bd2, not
# whatever the default is. (See "../etc/Solarized Dark.terminal" for OS X.)

set -x base03  "--bold black"
set -x base02  "black"
set -x base01  "--bold green"
set -x base00  "--bold yellow"
set -x base0   "--bold blue"
set -x base1   "--bold cyan"
set -x base2   "white"
set -x base3   "--bold white"
set -x yellow  "yellow"
set -x orange  "--bold red"
set -x red     "red"
set -x magenta "magenta"
set -x violet  "--bold magenta"
set -x blue    "blue"
set -x cyan    "cyan"
set -x green   "green"

# Use these settings if your terminal supports term256 and your terminal hasn't
# been configured with a Solarized theme.i.e. if "blue" is the default blue, not
# Solarized blue.
#
set -x base03  002b36
set -x base02  073642
set -x base01  586e75
set -x base00  657b83
set -x base0   839496
set -x base1   93a1a1
set -x base2   eee8d5
set -x base3   fdf6e3
set -x yellow  b58900
set -x orange  cb4b16
set -x red     dc322f
set -x magenta d33682
set -x violet  6c71c4
set -x blue    268bd2
set -x cyan    2aa198
set -x green   859900

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -x fish_color_normal      $base0
set -x fish_color_command     $base0
set -x fish_color_quote       $cyan
set -x fish_color_redirection $base0
set -x fish_color_end         $base0
set -x fish_color_error       $red
set -x fish_color_param       $blue
set -x fish_color_comment     $base01
set -x fish_color_match       $cyan
set -x fish_color_search_match "--background=$base02"
set -x fish_color_operator    $orange
set -x fish_color_escape      $cyan

# Used by fish_prompt

set -x fish_color_hostname    $cyan
set -x fish_color_cwd         $yellow
set -x fish_color_git         $green
