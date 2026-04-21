#!/bin/bash
#SBATCH -A uppmax2026-1-92 # Project ID
#SBATCH -N 1 # Number of nodes
#SBATCH --ntasks=8
#SBATCH --ntasks-per-node=8 # MPI tasks per node
#SBATCH --cpus-per-task=1
#SBATCH -t 00:0:30 # Time limit (hh:mm:ss)
# Load MPI module
module load OpenMPI/5.0.8-GCC-14.3.0
make
mpirun -n 4 ./stencil input120.txt bruh4.txt 4
mpirun -n 1 ./stencil input120.txt bruh1.txt 4
