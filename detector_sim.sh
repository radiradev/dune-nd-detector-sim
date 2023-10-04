#!/bin/bash
NUM_EVENTS=100
edep-sim -e $NUM_EVENTS -g config/nd_hall_only_lar.gdml -o  /global/cfs/cdirs/dune/users/rradev/edeps_small.root config/edep.mac

# if edep_out.h5 exists, delete it
if [ -f data/edep_out.h5 ]; then
    rm data/edep_out.h5
fi

# convert to h5
python3 dump_tree.py /global/cfs/cdirs/dune/users/rradev/edeps_small.root /global/cfs/cdirs/dune/users/rradev/edeps_small.h5
