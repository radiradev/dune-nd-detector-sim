#!/bin/bash
NUM_EVENTS=100000
edep-sim -e $NUM_EVENTS -g config/LArBathSmall.gdml -o  data/edep_out.root config/edep.mac

# if edep_out.h5 exists, delete it
if [ -f data/edep_out.h5 ]; then
    rm data/edep_out.h5
fi

# convert to h5
python3 dump_tree.py data/edep_out.root data/edep_out.h5
