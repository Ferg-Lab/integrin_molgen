#!/bin/sh
#SBATCH -J int1         # Job name
#SBATCH -o int1.o%j    # Name of stdout output file
#SBATCH -e int1.e%j    # Name of stderr error file
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

# equilibration
#x=0
#gmx grompp -f equil_$x.mdp -c emin-int1.gro -p ../intermediate1_ff/topol.top -po equil-out-$x.mdp -o equil-$x.tpr -r emin-int1.gro -maxwarn 1
#
#export OMP_NUM_THREADS=16
#gmx mdrun -ntomp $OMP_NUM_THREADS -pin on -s equil-$x.tpr -deffnm equil-int1-$x -nice 1 #-plumed plumed.dat

for curr in {7..8}
do
prev=$((curr-1))
echo $curr $prev
gmx grompp -f equil_$curr.mdp -c equil-int1-$prev.gro -p ../intermediate1_ff/topol.top -po equil-out-$curr.mdp -o equil-$curr.tpr -r equil-int1-$prev.gro -maxwarn 1

export OMP_NUM_THREADS=16
gmx mdrun -ntomp $OMP_NUM_THREADS -pin on -s equil-$curr.tpr -deffnm equil-int1-$curr -nice 1

done


