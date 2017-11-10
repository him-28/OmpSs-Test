#!/bin/bash
#BSUB -n 16
#BSUB -R "span[ptile=16]"
#BSUB -oo ompss-ee_%J.out
#BSUB -eo ompss-ee_%J.err
##BSUB -U patc5
#BSUB -J ompss-ee
#BSUB -W 00:15
#BSUB -x


PROGRAM=cholesky-p

export IFS=";"

THREADS="01;02;03;04;05;06;07;08;09;10;11;12"
MSIZES="2048"
BSIZES="256"

for MS in $MSIZES; do
  for BS in $BSIZES; do
    for thread in $THREADS; do
      NX_SMP_WORKERS=$thread ./$PROGRAM $MS $BS 0
    done
  done
done
