# Configs 

This repo is for my personal $HOME directory configs. Installation has been delegated to Ansible and some helper shell scripts under `ansible/`. 

## Ansible Installation

The automation has been tested against Ansible-2.4. You can install ansible in your $HOME if python-virtualenv is already installed:
```
mkdir ~/bin
cd ~/bin
virtualenv .ansible-ve
. .ansible-ve/bin/activate
pip install --upgrade pip
pip install ansible==2.4.2
for file in .ansible-ve/bin/ansible*; do
    ln -s $file;
done
```

Make sure ~/bin is in your $PATH.
