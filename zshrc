# Use powerline
USE_POWERLINE="false"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi


source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "djui/alias-tips"

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pnpm", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh

zplug load


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#696969"
 
alias r="rails"
alias rs="rails server"
alias rc="rails console"
alias ru="rubocop"
alias rsp="rspec"
alias y="yarn"
alias n="npm"
alias bn="babel-node"
alias gtfo="rm -rf node_modules dist tmp && yarn install"
alias v="vue"
alias ys="yarn serve"
alias h="hanami"
alias hs="hanami server"
alias hc="hanami console"
alias yn="yay -Sl | rg "
alias cl="clear"
alias gbr="git branch | grep -v "master" | xargs git branch -D"
alias de="ddcutil setvcp 10"
alias pout="pnpm outdated"
alias tr="trans :pl"
alias rtr="trans pl:en"
 
eval "$(starship init zsh)"
