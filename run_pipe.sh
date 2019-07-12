#!/usr/bin/env bash

# run pipe pipeline
docker run -it --rm \
    -v "$(pwd)"/pipe_docker.conf:/application.conf \
    -v "$(pwd)"/v2d_data_output/parquet_files:/v2d_data_output \
    -v "$(pwd)"/static_files:/static_files \
    -v "$(pwd)"/Volumes/Hyve/variant-index:/variant-index \
    -v "$(pwd)"/pipe_output:/pipe_output \
    pipe \
    java -jar ot-geckopipe.jar variant-disease -f application.conf
#disease-variant-gene
