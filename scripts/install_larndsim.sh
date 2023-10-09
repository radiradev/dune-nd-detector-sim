!#bin/bash
module load python
module load cudatoolkit
python3 -m venv larnd-sim.venv

source larnd-sim.venv/bin/activate
pip install --upgrade pip setuptools wheel

git clone https://github.com/DUNE/larnd-sim
cd larnd-sim
git checkout 962804f
pip install cupy-cuda11x
SKIP_CUPY_INSTALL=1 pip install -e .

