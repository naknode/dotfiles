
###-tns-completion-start-###
if [ -f /Users/dan/.tnsrc ]; then 
    source /Users/dan/.tnsrc 
fi
###-tns-completion-end-###

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
