
# TODO: consolidate .local.bash and .alias.bash

######### 
#   misc 

# clear ruby error from twurl
# http://stackoverflow.com/questions/20803933/turn-off-ruby-2-1-deprecated-ruby-heap-min-slots-warning
unset RUBY_HEAP_MIN_SLOTS
 
# be sure to use vim
export EDITOR=$(which vim)

#   / misc 
######### 


######### 
#   python 

# virtualenvwrapper setup (2015)
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

## anaconda (2017)
source /Users/jmontague/anaconda3/etc/profile.d/conda.sh

#   / python
########


# check for aliases 
[[ -s ${HOME}/.alias.bash ]] && source ${HOME}/.alias.bash
