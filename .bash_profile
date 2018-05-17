source ~/scripts/git-completion.bash
export PATH=/usr/bin/java:$PATH
# PS1="\[\033[0;32m\][\t][\u:\w]\$ \[\033[0m\]"
source '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh'
PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\][\t] \u:\[\033[0;36m\] \w\[\033[1;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\]▶\[\033[0m\033[0;32m\]\[\033[0m\] '
eval $(thefuck --alias)
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joshuakolber/google-cloud-sdk/path.bash.inc' ]; then source '/Users/joshuakolber/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joshuakolber/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/joshuakolber/google-cloud-sdk/completion.bash.inc'; fi

alias ls='ls -G'
alias tags='ctags -R --exclude="*.js" .  $(bundle list --paths)'
alias supergrep='grep -rnw . --exclude-dir="./log" --exclude-dir="./node_modules" --exclude="tags" -e'
export TERM=xterm-256color
source ~/scripts/docker-helper.bash

export FZF_DEFAULT_COMMAND='fd --type f'
##
# Your previous /Users/joshuakolber/.bash_profile file was backed up as /Users/joshuakolber/.bash_profile.macports-saved_2017-11-09_at_14:12:26
##

# MacPorts Installer addition on 2017-11-09_at_14:12:26: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="$PATH:/Users/joshuakolber/dev/depot_tools"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="/usr/local/sbin:$PATH"
