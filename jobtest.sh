#!/bin/bash -l
#SBATCH -N 8
#SBATCH -J hdf5test

cd /lustre/ttscratch1/brobey
dsize=$(( 10**9 ))
#for ((inc=0; i<7; i++))
for ((nodes=1; nodes<8; nodes++))
do
   runstring="srun -N $nodes -n 8 /users/brobey/hdf5proxy/hdf5proxy -size $dsize -nb_files 1"
   echo $runstring
   echo -n "Data size is $dsize Nodes is $nodes "
   eval "$runstring  |grep 'Elapsed time'"
   #dsize=$(( $dsize*2 ))
done

