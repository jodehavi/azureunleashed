#!/bin/bash

logger  "setup.sh - Run apt update"
sudo apt update
logger  "setup.sh - Run apt upgrade"
sudo apt -y upgrade

logger  "setup.sh - Installing Git"
sudo apt -y install git
logger  "setup.sh - Installing Docker"
sudo apt -y install docker.io