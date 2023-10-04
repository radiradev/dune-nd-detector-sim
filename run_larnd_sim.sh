module load python 
module load cudatoolkit

source larnd-sim.venv/bin/activate

#if output file exists, delete it
if [ -f /global/cfs/cdirs/dune/users/rradev/larndsim_out.h5 ]; then
    rm /global/cfs/cdirs/dune/users/rradev/larndsim_out.h5
fi


simulate_pixels.py \
--input_filename=/global/cfs/cdirs/dune/users/rradev/edeps_small.h5 \
--detector_properties=larnd-sim/larndsim/detector_properties/ndlar-module.yaml \
--pixel_layout=larnd-sim/larndsim/pixel_layouts/multi_tile_layout-3.0.40.yaml \
--output_filename=/global/cfs/cdirs/dune/users/rradev/larndsim_out.h5 \
--response_file=larnd-sim/larndsim/bin/response_38.npy \
--n_tracks=10