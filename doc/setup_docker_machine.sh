#!/usr/bin/env sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.
sh -O miniconda.sh
chmod +x miniconda.sh
tce-load -wi bash.tcz
tce-load -wi linux-kernel-sources-env.tcz
bash ./miniconda.sh -b -p ~/miniconda3
export PATH=~/miniconda3/bin:$PATH
conda create -n py3 python=3 numpy nomkl pytest  # mkl is too large
source activate py3
conda install epics-base readline -c lightsource  # for 'caget' in test
git clone https://github.com/danielballan/caproto
cd caproto
pip install -r test-requirements.txt
export DOCKER0_IP=$(/sbin/ifconfig docker0 |grep 'inet addr' | sed -e 's/.*addr:\([^ ]*\).*/\1/')
export EPICS_CA_ADDR_LIST=$( echo $DOCKER0_IP | sed -e 's/^\([0-9]\+\)\.\([0-9]\+\)\..*$/\1.\2.255.255/' )
export EPICS_CA_AUTO_ADDR_LIST="no"
export EPICS_CA_MAX_ARRAY_BYTES=10000000
