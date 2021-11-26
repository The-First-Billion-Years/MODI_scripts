#!/bin/bash

# Activate conda in your PATH
# This ensures that we discover every conda environment
# before we try to activate it.
source $CONDA_DIR/etc/profile.d/conda.sh
echo source $CONDA_DIR/etc/profile.d/conda.sh

# Create environment
~/modi_mount/MODI_scripts/install/install_reionizer.sh

# activate environment
conda init bash
conda activate lya_env
conda list

# run lightcones code
cd ~/modi_mount/code/LyaInference/
git pull
python -c "import reionizer"
