export PATH=$HOME/bin:/usr/local/bin:~/.config/composer/vendor/bin:$PATH
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="afowler"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview';

export PATH="/home/dan/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# export VIMINIT='source $MYVIMRC'
export EDITOR='vim'
export MYVIMRC='~/.vimrc'
export MYNVIMRC='~/.config/nvim/init.vim'
export TMUXCONF='~/.tmux.conf'

export PATH="$PATH:`yarn global bin`"

eval "$(fasd --init auto)"

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
source /home/dan/.bash_profile

# Path to your oh-my-zsh installation.
export ZSH=/home/dan/.oh-my-zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

#---------
# ALIASES
#---------
# Ubuntu
# Blueooth 1.0
alias bt1="pactl unload-module  module-bluetooth-discover"
alias b2="pactl unload-module  module-bluetooth-discover || pactl   load-module  module-bluetooth-discover"
alias bt="pactl load-module module-bluetooth-discover"
# Heroku
alias h="heroku --app delaford"
alias hl="heroku logs --tail --app delaford"
alias hrb="heroku run bash"

alias dan="vim"

alias ggr="ghost restart"

# Utilities
alias cat="batcat"

# NPM Scripts
alias ns="npm start"
alias nb="npm run build"
alias nrw="npm run watch"
alias qq="npm run ndb"

alias nrbg="npm run build:graphql"

# Private SSHs
alias sshdf="sshcd root@delaford.com:/usr/share/nginx/html"

alias q="yarn server"
alias lg="lazygit"
alias g="git"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias wip="git add . && git commit -m 'wip'"
alias nah="git reset --hard && git clean -df"
alias p="vendor/bin/phpunit"
alias pf="vendor/bin/phpunit --filter "
alias art="php artisan"
alias gc="git checkout"
alias gtd="git checkout dev"
alias gtm="git checkout master"
alias gfp="git fetch && git pull"
alias gs="git status"
alias gpp="git push"
alias migrate="php artisan migrate"
alias aserve="php artisan serve"
alias tinker="php artisan tinker"
alias mfs="php artisan migrate:fresh --seed"
alias mf="php artisan migrate:fresh"
alias vd="ls -la"
alias cls="clear"
alias phpserv="php -S localhost:7777 -t ."

alias ss="sublime ."

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias finder='open -a 'Finder' .'
alias ip="curl icanhazip.com"
alias rcli="redis-cli"

alias ezsh="vim ~/.zshrc"
alias ebash="vim ~/.bash_profile"
alias ephpcs="vim ~/.vscode/.php_cs"
alias etmux="vim ~/.tmux.conf"
alias envim="nvim ~/.config/nvim/init.vim"

alias ma='tmux attach || { (while ! tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh; do sleep 0.2; done)& tmux ; }'

alias phpini='sublime "$(pecl config-get php_ini)"'

# Projects
# Delaford
alias vs="npm run serve"
alias dn="npm run dev:node"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export NVM_DIR="/Users/dan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###-tns-completion-start-###
if [ -f /Users/dan/.tnsrc ]; then
    source /Users/dan/.tnsrc
fi
###-tns-completion-end-###

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/dan/code/git/Conquer_Them_All/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/dan/code/git/Conquer_Them_All/node_modules/tabtab/.completions/electron-forge.zsh

export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"


autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zshexport PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
