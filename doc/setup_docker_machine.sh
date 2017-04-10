#!/usr/bin/env sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.
sh -O miniconda.sh
chmod +x miniconda.sh
tce-load -wi bash.tcz
bash ./miniconda.sh -b -p ~/miniconda3
export PATH=~/miniconda3/bin:$PATH
conda create -n py3 python=3 numpy nomkl pytest  # mkl is too large
source activate py3
git clone https://github.com/danielballan/caproto
cd caproto
pip install -r test-requirements.txt
