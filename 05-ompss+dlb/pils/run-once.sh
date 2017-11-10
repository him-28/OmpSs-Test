#!/bin/bash
#BSUB -n 16
#BSUB -R "span[ptile=8]"
#BSUB -oo ompss-ee_%J.out
#BSUB -eo ompss-ee_%J.err
##BSUB -U patc5
#BSUB -J ompss-ee
#BSUB -W 00:15
#BSUB -x

PROGRAM=mpi_ompss_pils-i

# Uncomment to instrument
# export INST=./trace.sh

# Uncomment to enable DLB
# export NX_ARGS+=" --thread-manager=dlb"
# export DLB_ARGS+=" --policy=auto_LeWI_mask"

# Uncomment to enable DLB MPI interception
# export OMPSSEE_LD_PRELOAD=$DLB_HOME/lib/libdlb_mpi_instr.so

export NX_ARGS+=" --force-tie-master --warmup-threads"

mpirun $INST ./$PROGRAM /dev/null 1 5 500
