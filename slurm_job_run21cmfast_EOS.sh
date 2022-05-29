#!/bin/bash
#SBATCH --job-name=lightcones_EOS
#SBATCH --partition=modi_max
#SBATCH --ntasks=1

srun singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_EOS.sh