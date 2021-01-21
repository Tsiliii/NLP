#!/bin/bash
source path.sh
#sudo steps/train_mono.sh train lang n-gram/monotrue
#sudo utils/mkgraph.sh lang n-gram/mono n-gram/monotrue/graph
#sudo steps/decode.sh n-gram/monotrue/graph test n-gram/monotrue/decode_test
#steps/align_si.sh train lang n-gram/monotrue n-gram/mono_ali
[ -d n-gram/monotrue/decode_dev ] && grep WER n-gram/monotrue/decode_dev/wer_* | utils/best_wer.sh
