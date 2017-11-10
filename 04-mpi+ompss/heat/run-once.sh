#!/bin/bash
#BSUB -n 16
#BSUB -R "span[ptile=8]"
#BSUB -oo ompss-ee_%J.out
#BSUB -eo ompss-ee_%J.err
##BSUB -U patc5
#BSUB -J ompss-ee
#BSUB -W 00:15
#BSUB -x

PROGRAM=heat-mpi-ompss-i

# Run with 2 threads per MPI process in the same node

export SMP_NUM_WORKERS=2

# Uncomment to instrument
#export INST=./graph.sh
#export INST=./trace.sh

mpirun $INST ./$PROGRAM test.dat test.ppm
