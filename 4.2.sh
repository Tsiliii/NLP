#!/bin/bash
source ./path.sh

cd local/dict

build-lm.sh -i local/dict/lm_dev.txt -n 1 -o local/lm_tmp/lm_dev_unigram.ilm.gz --debug
