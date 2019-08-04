# Depends on the git plugin for work_in_progress()

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function node_prompt_version {
  if which node &> /dev/null; then
    echo "%{$fg[green]%}[$(node -v)]%{$reset_color%}"
  fi
}

function ruby_prompt_version {
  echo "$(ruby_prompt_info | sed 's/ruby-/v/')"
}

function elixir_prompt_version {
  if which elixir &> /dev/null; then
    echo "%{$fg[magenta]%}[v$(elixir -v | rg -oP '(?<=Elixir )[^ ]*')]%{$reset_color%}"
  fi
}

# RVM component of prompt
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
RPS1='$(git_custom_status)$(node_prompt_version)$(ruby_prompt_version)$(elixir_prompt_version)[%D{%H:%M:%S}] $EPS1'

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
