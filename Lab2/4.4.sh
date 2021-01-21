#!/bin/bash
source path.sh
#sudo steps/train_mono.sh train lang n-gram/mono
#utils/mkgraph.sh lang n-gram/mono n-gram/mono/graph

sudo steps/decode.sh n-gram/mono/graph test n-gram/mono/decode_test

