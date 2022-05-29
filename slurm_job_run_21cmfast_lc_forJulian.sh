#!/bin/bash
#SBATCH --job-name=lightcones_julian
#SBATCH --partition=modi_short
#SBATCH --ntasks=4
#SBATCH --time=01:00:00
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1

srun -n 1 singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian_kpeak.sh 1
srun -n 1 singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian_kpeak.sh 0 F_STAR10 -1.5 &
srun -n 1 singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian_kpeak.sh 0 F_STAR7_MINI -3.0 &
srun -n 1 singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian_kpeak.sh 0 log10_k_PEAK 1.7 &
wait
