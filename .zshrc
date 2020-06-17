export PATH=$HOME/bin:/usr/local/bin:~/.composer/vendor/bin:$PATH
ZSH_DISABLE_COMPFIX=true
# ZSH_THEME="af-magic"

# export VIMINIT='source $MYVIMRC'
export EDITOR='vim'
export MYVIMRC='~/.vimrc'
export MYNVIMRC='~/.config/nvim/init.vim'
export TMUXCONF='~/.tmux.conf'

eval "$(fasd --init auto)"

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
source /Users/dan/.bash_profile
path+=('/Library/Frameworks/Mono.framework/Versions/Current/bin')
# PHP Debugging for VS Code
#export XDEBUG_CONFIG="idekey=VSCODE"
#export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_HOME=/Users/dan/Library/Android/sdk

# DBngin exports
export PATH=/Users/Shared/DBngin/mysql/8.0.12/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/dan/.oh-my-zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

#---------
# ALIASES
#---------
# Heroku
alias h="heroku --app delaford"
alias hl="heroku logs --tail --app delaford"
alias hrb="heroku run bash"

alias ggr="ghost restart"

# Utilities
alias cat="bat"

# NPM Scripts
alias nrw="npm run watch"
alias qq="npm run ndb"

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

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

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

eval "$(rbenv init -)"
export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

  # Set Spaceship ZSH as a prompt
#  autoload -U promptinit; promptinit
#  prompt spaceship
autoload -U promptinit; promptinit
prompt pure
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
