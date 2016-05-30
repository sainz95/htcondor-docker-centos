#!/bin/bash

# Set the master hostname (if required)
[ -n "$MASTER" ] && sed -i 's/\(CONDOR_HOST\s*=\s*\)\$(FULL_HOSTNAME)/\1'"$MASTER"'/' /etc/condor/condor_config

# Clean up after ourselves
trap "{ /usr/sbin/condor_off -master; exit 0; }" TERM

# Boot up HTCondor and wait for it
/usr/sbin/condor_master -f &

PID=$!
wait $PID
