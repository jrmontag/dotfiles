
# TODO: consolidate .local.bash and .alias.bash

######### 
#   misc 

# clear ruby error from twurl
# http://stackoverflow.com/questions/20803933/turn-off-ruby-2-1-deprecated-ruby-heap-min-slots-warning
unset RUBY_HEAP_MIN_SLOTS

#   / misc 
######### 



######### 
#   python 

# virtualenvwrapper setup ( 2015-01-23 )
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# from the python bootstrap, per install instructions ( 2015-01-23 )
PATH=/Users/jmontague/Python/PyPy-2.2.1/bin:$PATH

#   / python
########


# check for aliases ( 2015-01-22 )
[[ -s ${HOME}/.alias.bash ]] && source ${HOME}/.alias.bash

