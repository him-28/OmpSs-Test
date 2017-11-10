#!/bin/bash
#BSUB -n 16
#BSUB -R "span[ptile=16]"
#BSUB -oo ompss-ee_%J.out
#BSUB -eo ompss-ee_%J.err
##BSUB -U patc5
#BSUB -J ompss-ee
#BSUB -W 00:15
#BSUB -x

PROGRAM=ompss_pils-p