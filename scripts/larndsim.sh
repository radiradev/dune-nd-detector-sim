#!/bin/bash
#SBATCH -A dune_g
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH -c 32
#SBATCH --gpus-per-task=1
#SBATCH --gpu-bind=none
#SBATCH --array=0-999

module load python 
module load cudatoolkit

source larnd-sim.venv/bin/activate

LARNDSIM_OUT="/global/cfs/cdirs/dune/users/rradev/larndsim_out_${SLURM_ARRAY_TASK_ID}.h5"
INPUT_FILE="/global/cfs/cdirs/dune/users/rradev/edeps_out/h5/edeps_out_${SLURM_ARRAY_TASK_ID}.h5"

#if output file exists, delete it
if [ -f $LARNDSIM_OUT ]; then
    rm $LARNDSIM_OUT
fi

simulate_pixels.py \
--input_filename=$INPUT_FILE \
--detector_properties=larnd-sim/larndsim/detector_properties/ndlar-module.yaml \
--pixel_layout=larnd-sim/larndsim/pixel_layouts/multi_tile_layout-3.0.40.yaml \
--output_filename=$LARNDSIM_OUT \
--response_file=larnd-sim/larndsim/bin/response_38.npy