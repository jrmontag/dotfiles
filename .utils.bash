##########################
# General bash utilities
# 
#   - source this file at the top of any bash script to use these tools, eg:
# 
# source ${HOME}/.utils.bash
#


## throttle parallel processes by name 
#   set some sensible defaults for params, but also expect 
#   them to be declared inline at run-time
# process name (via pgrep) 
procName=cat
# simultaneous processes of name procName allowed  
MAXPROCS=3
# seconds to wait between checks of processlist
SLEEPTIME=10
waitForNProcs() {
    # `waitForNProcs` goes at end of for loop 
    # set at top of loop:
    #   procName=gzip
    #   MAXPROCS=3
    #   SLEEPTIME=5
    nprocs=$(pgrep -f $procName -U ${UID} | wc -l)
    # (ge b/c pgrep has an extra line) 
    while [ $nprocs -ge $MAXPROCS ]; do
        sleep $SLEEPTIME
        nprocs=$(pgrep -f $procName -U ${UID} | wc -l)
    done
}

export -f waitForNProcs


