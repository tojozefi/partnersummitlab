#!/bin/bash
#PBS -j oe
#PBS -l select=2:ncpus=16

source /opt/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh
cd ${PBS_O_WORKDIR}
mpirun -np 2 -ppn 1 -hostfile ${PBS_NODEFILE} IMB-MPI1 pingpong
