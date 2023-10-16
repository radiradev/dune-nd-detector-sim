#!/bin/bash
id=$1
PARTICLE_NAME=$2

NUM_EVENTS=100
CONFIG_GDML="/global/homes/r/rradev/particle_bomb/config/nd_hall_only_lar.gdml"
EDEPS_DIR="/global/cfs/cdirs/dune/users/rradev/contrastive/individual_particles"
EDEP_MACRO="g4_${PARTICLE_NAME}.mac"


OUTPUT_ROOT="${EDEPS_DIR}/${PARTICLE_NAME}_edeps_out_${id}.root"
OUTPUT_H5="${EDEPS_DIR}/${PARTICLE_NAME}_edeps_out_${id}.h5"

# Run the edep-sim command
shifter --image=deeplearnphysics/dune-nd-sim:ub20.04-cpubase-edep2supera edep-sim -e $NUM_EVENTS -g $CONFIG_GDML -o $OUTPUT_ROOT $EDEP_MACRO

# If edep_out.h5 exists locally, delete it
if [ -f $OUTPUT_H5 ]; then
    rm $OUTPUT_H5
fi

# Convert to h5
shifter --image=deeplearnphysics/dune-nd-sim:ub20.04-cpubase-edep2supera python3 dump_tree.py $OUTPUT_ROOT $OUTPUT_H5
