# SCRIPT TO LAUNCH TARGETED MD SIMULATIONS
for x in 'int1-int2' 'int1-open' 'int2-open'

do

cd $x
for b in 'int1'
do

for i in {0..9} 
do


cd target_md_"$b"_"$i"


# int1 based
cp ../../master_tmd/targetmd_plumed.dat .
cp ../../master_tmd/taac-run.sbatch .
sed s/XXXX/$i/g targetmd_plumed.dat > temp.dat
sed s/BBBB/$b/g temp.dat > temp2.dat
mv temp2.dat targetmd_plumed.dat
rm -f temp.dat
init_rmsd_a=`(awk 'NR==2 {print $3}' init_rmsd_a_results.dat)`
init_rmsd_b=`(awk 'NR==2 {print $3}' init_rmsd_b_results.dat)`
sed s/FFFF/$init_rmsd_a/g targetmd_plumed.dat > temp.dat
sed s/SSSS/$init_rmsd_b/g temp.dat > temp2.dat
mv temp2.dat targetmd_plumed.dat
rm -f temp.dat temp2.dat

# NOTE: equil-int1-7.gro can be obtained from https://github.com/tamarabidone/multiscale-model-alphaIIbBeta3.
# Also see all-atom directory.
echo "gmx grompp -f run.mdp -c ../../all-atom/intermediate1_ff/equil/equil-int1-7.gro -p ../../all-atom/intermediate1_ff/topol.top -po run-out.mdp -o run.tpr" >> taac-run.sbatch
echo -e "\n" >> taac-run.sbatch
echo "gmx mdrun -s run.tpr -deffnm run-tmd -plumed targetmd_plumed.dat" >> taac-run.sbatch 

sbatch taac-run.sbatch

rm -f *#

cd ..

done

done

cd ..

done
