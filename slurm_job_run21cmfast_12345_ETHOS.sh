#!/bin/bash
#SBATCH --job-name=lightcones_ETHOS_hpeak_0
#SBATCH --partition=modi_long

srun singularity exec ~/modi_images/hpc-notebook_latest.sif ~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_ETHOS.sh