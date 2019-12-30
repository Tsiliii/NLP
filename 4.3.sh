#!/bin/bash
source ./path.sh

# Make spk2utt files that are necessary for the MFCC extraction
utils/utt2spk_to_spk2utt.pl train/utt2spk > train/spk2utt
utils/utt2spk_to_spk2utt.pl dev/utt2spk > dev/spk2utt
utils/utt2spk_to_spk2utt.pl test/utt2spk > test/spk2utt

# Extract MFCC features.
for x in train test dev; do
	sudo steps/make_mfcc.sh /$x
	sudo steps/compute_cmvn_stats.sh $x 
done


# Number of frames per sentence
feat-to-len scp:train/feats.scp ark,t:train/feats.lengths
# Print first 5 sentences.
head -5 train/feats.lengths
