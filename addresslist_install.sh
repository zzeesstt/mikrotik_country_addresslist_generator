#!/bin/bash
sudo apt update && sudo apt upgrade -f
sudo apt install git python3-pip python3
git clone https://github.com/furriest/radb-tools.git
pip3 install -r radb-tools/requirements.txt

# run addresslist_generator.sh