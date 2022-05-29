#!/bin/bash

# get random seed
refresh=$1
astro_param=$2
v=$3
echo $astro_param $v $refresh

# Activate conda in your PATH
# This ensures that we discover every conda environment
# before we try to activate it.
source $CONDA_DIR/etc/profile.d/conda.sh
echo source $CONDA_DIR/etc/profile.d/conda.sh

# Create environment
conda init bash
conda activate 21cmfast
if [ $? != 0 ]; then
        ~/modi_mount/MODI_scripts/install/install_21cmfast.sh
   fi


cd ~/modi_mount/code/21cmfish/
if [ $refresh != 0 ]
then
    git pull
    # Make lightcones
    echo $astro_param $v $refresh python scripts/make_lightcones_examples.py 21cmFAST_config_files/EoS_mini_kpeak.config --num_cores 1 --h_PEAK 0.0 --dry_run

    python scripts/make_lightcones_examples.py 21cmFAST_config_files/EoS_mini_kpeak.config --num_cores 1 --h_PEAK 0.0
else
    # Make lightcones
    echo $astro_param $v $refresh python scripts/make_lightcones_examples.py 21cmFAST_config_files/EoS_mini_kpeak.config --num_cores 1 --h_PEAK 0.0 --astro_param $astro_param --astro_param_value $v --dry_run

    python scripts/make_lightcones_examples.py 21cmFAST_config_files/EoS_mini_kpeak.config --num_cores 1 --h_PEAK 0.0 --astro_param $astro_param --astro_param_value $v
fi