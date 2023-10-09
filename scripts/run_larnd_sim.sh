module load python 
module load cudatoolkit

source larnd-sim.venv/bin/activate

LARNDSIM_OUT="/global/cfs/cdirs/dune/users/rradev/larndsim_out.h5"
#if output file exists, delete it
if [ -f $LARNDSIM_OUT ]; then
    rm $LARNDSIM_OUT
fi


simulate_pixels.py \
--input_filename=/global/cfs/cdirs/dune/users/rradev/edeps_out.h5 \
--detector_properties=larnd-sim/larndsim/detector_properties/ndlar-module.yaml \
--pixel_layout=larnd-sim/larndsim/pixel_layouts/multi_tile_layout-3.0.40.yaml \
--output_filename=$LARNDSIM_OUT \
--response_file=larnd-sim/larndsim/bin/response_38.npy 
