
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

source /Users/jmontague/miniconda3/etc/profile.d/conda.sh
# added by Miniconda3 installer (JM: comment out for opt-in conda) 
#export PATH="/Users/jmontague/miniconda3/bin:$PATH"

#   / python
########


# check for aliases 
[[ -s ${HOME}/.alias.bash ]] && source ${HOME}/.alias.bash
