# Salt-Playground

## Setup

### libgit2 with SSL

https://www.linkedin.com/pulse/saltstacks-gitfs-ubuntu-denis-kalinin

```bash
#!/bin/bash
apt install python-pip -y
pip install --upgrade pip
pip install pyyaml
# installing pygit2 + HTTPS support
apt install libssl-dev -y
apt install make -y
apt install cmake -y
wget https://github.com/libgit2/libgit2/archive/v0.26.3.tar.gz
tar xzf v0.26.3.tar.gz
cd libgit2-0.26.3/
cmake .
make
make install
ldconfig
pip install cffi
pip install pygit2
cd ../
# saltstack configuration
masterConfig='{"auto_accept":true,"fileserver_backend":["git","roots"],\
"winrepo_remotes":[],"loop_interval":90,\
"gitfs_remotes":[{"https://example.com/project/salt-formulas.git":\
[{"root":"salt"}]},"https://example.com/project/custom-salt.git"],\
"ext_pillar":[{"git":[{"https://example.com/project/pillars.git":\
[{"root":"pillar"}]}]}]}'
minionConfig='{"master":"localhost","id":"heat-master",\
"hash_type":"sha256","startup_states":"highstate",\
"grains":{"role":["heat","master","esb"],"cluster":"test-1"}}'
curl -o bootstrap_salt.sh -L https://bootstrap.saltstack.com
bash bootstrap_salt.sh -M -J $masterConfig -j $minionConfig
```
