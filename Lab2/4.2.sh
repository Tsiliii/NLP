#!/bin/bash
source path.sh

build-lm.sh -i local/dict/lm_train.txt -n 1 -o local/lm_tmp/lm_train_unigram.ilm.gz
build-lm.sh -i local/dict/lm_train.txt -n 2 -o local/lm_tmp/lm_train_bigram.ilm.gz

build-lm.sh -i local/dict/lm_dev.txt -n 1 -o local/lm_tmp/lm_dev_unigram.ilm.gz
build-lm.sh -i local/dict/lm_dev.txt -n 2 -o local/lm_tmp/lm_dev_bigram.ilm.gz

build-lm.sh -i local/dict/lm_test.txt -n 1 -o local/lm_tmp/lm_test_unigram.ilm.gz
build-lm.sh -i local/dict/lm_test.txt -n 2 -o local/lm_tmp/lm_test_bigram.ilm.gz

compile-lm local/lm_tmp/lm_dev_bigram.ilm.gz -t=yes /dev/stdout | grep -v unk | gzip -c > local/nist_lm/lm_dev_bigram.arpa.gz
compile-lm local/lm_tmp/lm_dev_unigram.ilm.gz -t=yes /dev/stdout | grep -v unk | gzip -c > local/nist_lm/lm_dev_unigram.arpa.gz

compile-lm local/lm_tmp/lm_train_bigram.ilm.gz -t=yes /dev/stdout | grep -v unk | gzip -c > local/nist_lm/lm_train_bigram.arpa.gz
compile-lm local/lm_tmp/lm_train_unigram.ilm.gz -t=yes /dev/stdout | grep -v unk | gzip -c > local/nist_lm/lm_train_unigram.arpa.gz

compile-lm local/lm_tmp/lm_test_bigram.ilm.gz -t=yes /dev/stdout | grep -v unk | gzip -c > local/nist_lm/lm_test_bigram.arpa.gz
compile-lm local/lm_tmp/lm_test_unigram.ilm.gz -t=yes /dev/stdout | grep -v unk | gzip -c > local/nist_lm/lm_test_unigram.arpa.gz

compile-lm local/lm_tmp/lm_dev_bigram.arpa.gz --eval=local/lm_dev1.txt
compile-lm local/lm_tmp/lm_dev_unigram.ilm.gz --eval=local/lm_dev2.txt

compile-lm local/lm_tmp/lm_test_bigram.ilm.gz --eval=local/lm_dev3.txt
compile-lm local/lm_tmp/lm_test_unigram.ilm.gz --eval=local/lm_dev4.txt

prepare_lang.sh local/dict "<oov>" local/lang lang

./timit_format_data.sh
