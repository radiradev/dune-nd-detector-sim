# Simple DUNE ND-like event generation

Based on documentation from the SLAC group: 
- [ND simulation how-to](https://hackmd.io/@CuhPVDY3Qregu7G4lr1p7A/H1d1Zj4zi) - if you follow this make sure to execute `edep-sim` without passing the `-u` argument - this causes errors.
- [ParticleBomb documentation](https://www.deeplearnphysics.org/DLPGenerator/Configuration.html)

We use [this](https://github.com/DUNE/larnd-sim/tree/962804f88ae8b2e9b3f8914fdd2e83177cb770b6) `larnd-sim` version.

Shfiter (docker) container `deeplearnphysics/dune-nd-sim:ub20.04-cpubase-edep2supera` or `deeplearnphysics/larcv2:ub20.04-cuda11.3-cudnn8-pytorch1.10.0-larndsim`