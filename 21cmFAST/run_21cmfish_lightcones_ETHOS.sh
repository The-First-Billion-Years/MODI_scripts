#!/bin/bash

# get random seed
r=12345
echo "Random seed =" $r

# h_PEAK
# h=$( echo "0.0" | bc )
# echo "h_PEAK =" $h

# Activate conda in your PATH
# This ensures that we discover every conda environment
# before we try to activate it.
source $CONDA_DIR/etc/profile.d/conda.sh
echo source $CONDA_DIR/etc/profile.d/conda.sh

# Create environment
~/modi_mount/MODI_scripts/install/install_21cmfast.sh

# activate environment
conda init bash
conda activate 21cmfast
conda list

# run lightcones code
cd ~/modi_mount/code/21cmfish/
git pull

# Run 21cmfish to make lightcones

# Make ETHOS lightcones
echo python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/ETHOS.config --num_cores 2 --h_PEAK 0 --random_seed $r

python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/ETHOS.config --num_cores 2 --h_PEAK 0 --random_seed $r