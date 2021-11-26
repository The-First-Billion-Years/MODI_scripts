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
# conda remove -n lya_env --all -y
conda activate lya_env
if [ $? != 0 ]; then
  conda create -n lya_env python=3.7
  conda activate lya_env
fi
echo conda activate lya_env

# install requirements
conda install pip

# Make sure the code can find the data
export LYA_DATA_DIR=~/erda_mount/FirstBillionYears/LyaInference_data/

# Afterwards we clone and install the LyaInference package itself
cd ~/modi_mount/code/LyaInference
python setup.py install
echo python setup.py install

# install pyqt for KDE
pip uninstall -y pyqt_fit
pip install git+git://github.com/charlottenosam/pyqt-fit.git
echo pip install git+git://github.com/charlottenosam/pyqt-fit.git

# test installation
python -c "import reionizer; print('Imported reionizer succesfully'); print(reionizer.get_xHI_tab())"
