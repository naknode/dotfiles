export PATH=$HOME/bin:/usr/local/bin:~/.config/composer/vendor/bin:$PATH
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="afowler"

# export VIMINIT='source $MYVIMRC'
export EDITOR='vim'
export MYVIMRC='~/.vimrc'
export MYNVIMRC='~/.config/nvim/init.vim'
export TMUXCONF='~/.tmux.conf'

eval "$(fasd --init auto)"

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
source /home/dan/.bash_profile

# Path to your oh-my-zsh installation.
export ZSH=/home/dan/.oh-my-zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

ZSH_THEME=""

# NPM Scripts
alias vs="npm run serve"
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

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
fpath=($fpath "/home/dan/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

export PATH=$PATH:/usr/local/go/bin

export CYPRESS_CRASH_REPORTS=0
