#!/bin/bash

# get random seed
r=$1
echo $r

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

# python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/EoS_mini_OPT.config --num_cores 1 --random_seed 10

# echo python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/EoS_mini_vary.config --num_cores 1 --random_seed $r

# python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/EoS_mini_vary.config --num_cores 1 --random_seed $r


# Make OPT lightcones
echo python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/EoS_mini_OPT.config --num_cores 1 --random_seed $r

python scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/EoS_mini_OPT.config --num_cores 1 --random_seed $r