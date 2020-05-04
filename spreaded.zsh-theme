# Based on Elessar theme
# https://github.com/fjpalacios/elessar-theme/blob/master/elessar.zsh-theme

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function get_git_status() {
  if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
    local git_status="$(git_prompt_status)"
    if [[ -n $git_status ]]; then
      git_status="($git_status%{$reset_color%}) "
    fi
    echo $git_status
  fi
}

PROMPT="$ret_status%{$fg_bold[cyan]%}%c%{$reset_color%}%{$reset_color%} "
RPROMPT='$(git_prompt_info)$(get_git_status)'

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%{$reset_color%}"

# Git status
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}=%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?%{$reset_color%}"
