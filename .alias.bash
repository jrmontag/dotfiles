########### 
# Aliases
# - generally meant for bash shell
# - includes small functions    
########### 


###################################
####    Section: General   ####
###################################


# ls aliases
#   a: show .foo
#   l: long listing 
#   F: indicate dirs/symlinks graphically
#   G: color
#   H: follow symlinks
#   (keep in order, so they build on each other)
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -alFGH"
alias l="ll"
alias lll="ll"

# odds and ends
alias ring="echo -e '\a'"
alias cler="clear"



## color support of ls and company 
# (note: these should be the last ls/grep/etc aliases)
# this doesn't seem to work? ( 2017-01-11 )
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias grep='grep --color=auto'


###################################
####    Section: git    ####
###################################

# git aliases
alias gita="git add"
alias gitb="git branch"
alias gitc="git commit"
alias gitd="git diff"
#alias gitp="git push"
alias gits="git status"



###################################
####    Section: CLI Tools    ####
###################################


## return the forecast for arg or inferred loc
wx () {
    curl http://wttr.in/$1
}

## Tw userid <=> Tw screen name
tw_user_lookup () {
    # returns comma-separated results 
    # usage: tw_user_lookup CASE ARGUMENT
    #           CASE = uname, uid 
    #           ARGUMENT = username, userid 
    lookup_case=$1
    lookup_arg=$2
    if [ "${lookup_case}" == "uid" ]; then
        lookup_query="user_id=" 
    elif [ "${lookup_case}" == "uname" ]; then
        lookup_query="screen_name=" 
    else
        echo ""
        echo ""
        echo "Invalid lookup CASE. Must be 'uid' or 'uname'."
        echo "  usage: tw_user_lookup CASE ARGUMENT"
        echo "              CASE = uname, uid" 
        echo "              ARGUMENT = [@]handle, userid" 
        echo ""
        echo "  output: twitter id,\"[@]handle\",\"display name\"" 
        echo "      eg: 47436444,\"jrmontag\",\"Josh Montague\"" 
        echo ""
        echo ""
        return  
    fi
    # headers to stderr
    #echo "user id, screen name, display name" >&2
    twurl /1.1/users/lookup.json?${lookup_query}${lookup_arg} | \
        #       userid, screen name, display name
        #                                          strip the array brackets
        jq '.[] | [.id, .screen_name, .name]' -c | sed 's/[][]//g'
}


## enable use of conda in this (and child) shell 
enable_conda() {
    export PATH="${HOME}/anaconda3/bin:$PATH"
}

## slightly easier than typing it all out
refresh_shell() {
    echo "sourcing your ~/.bash_profile ..."
    source ${HOME}/.bash_profile
}

## make and enter a new dir with one command
mkcd() {
    mkdir $1 && cd $1
}

## report sizes of directories (sorted)
alias dsize='for dir in *; do du -sk $dir; done | sort -n'

# create powertrack rules from "rule value" <TAB> "tag" file
alias jqrules="jq -R -s '. | split(\"\n\") | map( split(\"\t\") | {value: .[0], tag: .[1]} | select(.value != null) ) | { rules: . }'"

# look for big files in home directory
homespace() {
    sudo du -hS /home/ | sort -h
}

## fix matplotlibrc 'not a framework' error via backend 
#fix_mpl_backend() {
#    # is there a "check that this env variable exists" method?
#    if [ -ne "" "$VIRTUAL_ENV" ]; then 
#        RC_FILE=$(find $VIRTUAL_ENV -name "matplotlibrc")
#        sed -i .bak 's/macosx/Agg/' $RC_FILE
#        echo "created backup copy (.bak) of rc file..."
#    else
#        echo "No active virtualenv found." 
#        echo "Activate appropriate virtualenv and re-run this command..." 
#        echo
#    fi
#}

