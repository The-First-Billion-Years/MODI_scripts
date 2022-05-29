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
conda activate 21cmfast
if [ $? != 0 ]; then
    conda create -n 21cmfast python=3.9
    conda activate 21cmfast
fi
echo conda activate 21cmfast

# Install python packages
conda install gsl fftw
conda install numpy scipy click pyyaml cffi astropy h5py
conda install pip
pip install powerbox
ls /opt/conda/envs/21cmfast/include/fftw3.h

# Install 21cmfast
cd ~/modi_mount/code/21cmFAST
git checkout ETHOS_DM
INCLUDE=/opt/conda/envs/21cmfast/include LIB=/opt/conda/envs/21cmfast/lib  pip install -e .[dev]

# Install 21cmfish
# conda remove py21cmfish
pip uninstall -y py21cmfish
pip install git+https://github.com/charlottenosam/21cmfish.git
echo pip install git+https://github.com/charlottenosam/21cmfish.git

# test install
21cmfast --help