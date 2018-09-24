# BASHRC

# Homebrew -- TODO (osx v. ubuntu) 


# shell history 
export HISTCONTROL=erasedups # Remove duplicate entries.
export HISTSIZE=100000 # Keep a lengthy history.
export HISTIGNORE="l:ls:ll:pwd:* --help" # Exclude mundane commands.



# git prompt 
#   - useful if not using managed dev env
function parse_git_deleted {
    [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}

function parse_git_added {
    [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}

function parse_git_modified {
    [[ $(git status 2> /dev/null | grep "modified:\|committed:") != "" ]] && echo "*"
}

function parse_git_dirty {
    #[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "☠"
    echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# git in prompt
export PS1="\u@\h:\w \[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "


# for eg work servers, use larger TMPDIR for swap
if [ -d /mnt/tmp ]; then 
    export TMP=/mnt/tmp
    export TMPDIR=/mnt/tmp
fi

# source other handy things 
[ -s ${HOME}/.local.bash ] && source ${HOME}/.local.bash
[ -s ${HOME}/.utils.bash ] && source ${HOME}/.utils.bash

