#!/bin/bash
# srun singularity exec ~/modi_images/hpc-notebook_latest.sif ~/modi_mount/install_21cmfast.sh
srun singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian.sh
