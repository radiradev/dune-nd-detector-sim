### This is not needed as the the g4 macro already calls the generator
### However we can look at the output of the generator seperately if we'd like to 

import yaml
from dlp_generator import create_generator

config_filepath = 'config/pbomb_config.yaml'
cfg = yaml.load(open(config_filepath, 'r'), Loader=yaml.FullLoader)
cfg['Debug'] = True

# create and configure a generator
gen = create_generator(cfg)

# run the generator
result = gen.Generate()

# Convert the result into HEPEVT-like format, which is an array of length-15-array
hepevt = gen.Flatten(result)
print(hepevt)

# dump to a text file
with open('data/new_pbomb.hepevt', 'w') as f:
    for line in hepevt:
        f.write(' '.join([str(x) for x in line]) + '\n')