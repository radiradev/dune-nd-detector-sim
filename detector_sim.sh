#!/bin/bash
#SBATCH --image=deeplearnphysics/dune-nd-sim:ub20.04-cpubase-edep2supera
#SBATCH --qos=regular
#SBATCH --constraint=cpu
#SBATCH --nodes=1
#SBATCH --time=02:00:00

bash scripts/detector_sim.sh
