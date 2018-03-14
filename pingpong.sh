#!/bin/bash
# Example usage: ./pingpong.sh | grep -e ' 512 ' -e NODES -e usec

source /opt/intel/impi/`ls /opt/intel/impi`/bin64/mpivars.sh

for NODE in `cat ~/nodeips.txt`; do 
    for NODE2 in `cat ~/nodeips.txt`; do 
        echo '##################################################' && \
        echo NODES: $NODE, $NODE2 && \
        echo '##################################################'
        mpirun -hosts $NODE,$NODE2 -ppn 1 -n 2 \
            -env I_MPI_FABRICS=dapl \
            -env I_MPI_DAPL_PROVIDER=ofa-v2-ib0 \
            -env I_MPI_DYNAMIC_CONNECTION=0 \
            IMB-MPI1 pingpong
    done;
done

