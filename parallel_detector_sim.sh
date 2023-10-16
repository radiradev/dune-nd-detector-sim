#!/bin/bash

module load parallel
# Set your desired values for local execution
PARTICLE_NAME=$1  # Replace with the desired particle name
PBOMB_CONFIG="config/${PARTICLE_NAME}.yaml"
sed "s|PBOMB_CONFIG_PLACEHOLDER|${PBOMB_CONFIG}|" config/g4.mac.template > scripts/g4_${PARTICLE_NAME}.mac

# Create a loop to generate a list of commands
for i in $(seq 0 250); do
    echo "bash scripts/detector_sim_local.sh $i $PARTICLE_NAME"
done | parallel --jobs $(nproc)  # Adjust the number of jobs as needed

# Clean up any temporary files if needed
# rm g4_${PARTICLE_NAME}.mac
