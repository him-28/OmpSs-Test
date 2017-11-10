#!/bin/bash
#BSUB -n 16
#BSUB -R "span[ptile=8]"
#BSUB -oo ompss-ee_%J.out
#BSUB -eo ompss-ee_%J.err
##BSUB -U patc5
#BSUB -J ompss-ee
#BSUB -W 00:15
#BSUB -x

PROGRAM=LUB-p

# Uncomment to enable DLB
# export NX_ARGS+=" --thread-manager=dlb"
# export DLB_ARGS+=" --policy=auto_LeWI_mask"

export NX_ARGS+=" --force-tie-master --warmup-threads"

for i in $(seq 1 3) ; do
    mpirun $INST ./$PROGRAM 8000 100 | grep 'time to compute'
done
