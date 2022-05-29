#!/bin/bash
#SBATCH --job-name=lightcones_ICs20
#SBATCH --partition=modi_long
#SBATCH --ntasks=1
#SBATCH --time=07:00:00

srun singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian.sh 20