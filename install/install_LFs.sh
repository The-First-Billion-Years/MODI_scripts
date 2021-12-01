#!/bin/bash

# Defines where the package should be installed.
# Since the modi_mount directory content is
# available on each node, we define the package(s) to be installed
# here so that the node can find it once the job is being executed.
export CONDA_PKGS_DIRS=~/modi_mount/conda_dir
echo export CONDA_PKGS_DIRS=~/modi_mount/conda_dir

# Activate conda in your PATH
# This ensures that we discover every conda environment
# before we try to activate it.
source $CONDA_DIR/etc/profile.d/conda.sh
echo source $CONDA_DIR/etc/profile.d/conda.sh

conda init bash
echo conda init bash

# Create environment
# conda remove -n 21cmfast --all -y
conda activate mtt_lf
if [ $? != 0 ]; then
  conda create -n mtt_lf python=3.7
  conda activate mtt_lf
fi
echo conda activate mtt_lf

# Install python packages
conda install numpy scipy astropy
conda install pip

# Compile stmf
cd ~/modi_mount/code/MTT2015-UVLF/stmf
make
./stmf

cd ..
outputdir='results'
z=4.9

# Make new LFs
python evolve_LM.py 0.0 0.3 2.0 3.8 4.9 5.9 6.8 7.9 9.0 10.4 11.1 12.0 13.0 14.0 15.0 16.0 $outputdir --z_calib $z --newLpred -v
