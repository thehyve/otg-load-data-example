#!/usr/bin/env bash

# pull all submodules
git submodule update --init --recursive

# download 1000 Genome data in 37th geneome build
./gdown.pl 'https://drive.google.com/uc?export=download&id=19btBjGKg81ioeDH3lqkp25r6uJyhQ0At' plink_format_b37.zip

# unzip 1000 Genome data 
unzip plink_format_b37.zip

# download variant index parquet
./gdown.pl 'https://drive.google.com/uc?export=download&id=1U2ASKjqzi5Pmd_McqbH27TjJRB1L3OBY' variant-index.tar
tar xf variant-index.tar

# build docker images
docker build ./v2d_data/ --tag v2d
docker build ./genetics-pipe/ --tag pipe
