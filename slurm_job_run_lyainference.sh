#!/bin/bash
srun singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/LyaInference/run_likelihoods.sh
