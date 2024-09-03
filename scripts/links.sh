#!/bin/zsh
get_fzf_options() {
    local fzf_options
    local fzf_default_options='-w 50% -h 50% --multi -0 --no-preview'
    fzf_options="$(tmux show -gqv '@fzf-url-fzf-options')"
    [ -n "$fzf_options" ] && echo "$fzf_options" || echo "$fzf_default_options"
}

fzf_filter() {
  eval "fzf-tmux $(get_fzf_options)"
}

open_url() {
    if hash xdg-open &>/dev/null; then
        nohup xdg-open "$@"
    elif hash open &>/dev/null; then
        nohup open "$@"
    elif [[ -n $BROWSER ]]; then
        nohup "$BROWSER" "$@"
    fi
}
# export TMUX_LINKS_SOURCE=~/.config/tmux-links.txt
fzf_filter < ~/.config/tmux-links.txt | \
    while read -r chosen; do
        open_url "$chosen"
    done
