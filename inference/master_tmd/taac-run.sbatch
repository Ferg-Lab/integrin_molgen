#!/bin/sh
#SBATCH -J int         # Job name
#SBATCH -o int.o%j    # Name of stdout output file
#SBATCH -e int.e%j    # Name of stderr error file
#SBATCH -p rtx	            # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 16               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 30:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-type=all    # Send email at begin and end of job
#SBATCH -A XXXX        # Project/Allocation name (req'd if you have more than 1)

module load cuda/11.3
module load gcc/9.1.0

# EDIT THE PATH BELOW TO GROMACS
PATH_TO_GROMACS=""
source $PATH_TO_GROMACS/bin/GMXRC
