# MODI scripts

Scripts to install and run custom programs on UCPH's MODI cluster environment

## MODI important information

More detailed information about using ERDA can be found on [github](https://github.com/diku-dk/hpps-e2020-pub/tree/master/modi-guide) and in the [MODI User Guide](https://erda.dk/public/MODI-user-guide.pdf).

- Jobs are submitted on MODI using [slurm](https://slurm.schedmd.com/overview.html), here is a [cheatsheet](https://gist.github.com/ctokheim/bf68b2c4b78e9851b469be3425470699).
- When running on MODI all your files need to be placed in `~/modi_mount` as this is the only folder the execution nodes can see. You need to place both the executable and any input/output files here. You can also only submit jobs from this folder, as the results cannot be written elsewhere.
- Additionally, the modi mount directory is currently limited to a maximum of 50 GB per user
- Scripts need to be executable

## Usage

### Download these scripts

Login to MODI with a HPC notebook environment using the instructions [here](https://github.com/diku-dk/hpps-e2020-pub/tree/master/modi-guide).

Download these files and make them executable
```
cd ~/modi_mount/
git clone https://github.com/The-First-Billion-Years/MODI_scripts.git
find MODI_scripts -type f -name "*.sh" -print0 |xargs -0 chmod a+x
```
If there are subsequent updates you can `git pull` in `MODI_scripts/` and run line 3 again

### Running programs

There is a 3 step process to running a program

1. Create the slurm job file e.g. `slurm_job.sh` which points to your main script
```
#!/bin/bash
srun singularity exec ~/modi_images/hpc-notebook_latest.sif \
~/modi_mount/MODI_scripts/21cmFAST/run_21cmfish_lightcones_for_Julian.sh
```

2. Create your main script e.g. (changing the install script and environment name as necessary)
```
#!/bin/bash

# Activate conda in your PATH
# This ensures that we discover every conda environment
# before we try to activate it.
source $CONDA_DIR/etc/profile.d/conda.sh

# Install packages and create environment
~/modi_mount/MODI_scripts/install/install_21cmfast.sh

# activate environment
conda init bash
conda activate 21cmfast

# run code
python ~/modi_mount/code/21cmfish/scripts/make_lightcones_for_fisher.py 21cmFAST_config_files/EoS_mini_OPT.config --num_cores 1 --random_seed 10
```

3. Run the code on MODI

- Jobs are submitted using [slurm](https://gist.github.com/ctokheim/bf68b2c4b78e9851b469be3425470699)
- For simple cases using one core you can run e.g. `sbatch slurm_job.sh` from the command line, but note this will stop if it runs longer than 15 mins
- For longer runs you can use one of the other partitions via e.g. `sbatch --partition=modi_long slurm_job.sh`.
- You can use `slurm` to use multiple cores e.g. for MPI

Timelimits on the partitions are as follows:
Partition  | Timelimit
-----------|----------
modi_devel | 15 mins
modi_short | 2 hrs
modi_long  | 7 hrs
modi_max   | 29 hrs
