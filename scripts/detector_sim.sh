#!/bin/bash
NUM_EVENTS=1000
CONFIG_GDML="config/nd_hall_only_lar.gdml"
EDEPS_DIR="/global/cfs/cdirs/dune/users/rradev"
OUTPUT_ROOT="${EDEPS_DIR}/edeps_out_small.root"
OUTPUT_H5="${EDEPS_DIR}/edeps_out_small.h5"
EDEP_MACRO="config/edep.mac"

# Run the edep-sim command
edep-sim -e $NUM_EVENTS -g $CONFIG_GDML -o $OUTPUT_ROOT $EDEP_MACRO

# If edep_out.h5 exists locally, delete it
if [ -f $OUTPUT_H5 ]; then
    rm $OUTPUT_H5
fi

# Convert to h5
python3 dump_tree.py $OUTPUT_ROOT $OUTPUT_H5
