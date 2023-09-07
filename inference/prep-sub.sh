# THIS SCRIPT IS TO GET THE INITIAL RMSD VALUES IN PLUMED FILE.

for x in 'int1-int2' 'int1-open' 'int2-open'
do

cd $x
for b in 'int1'
do

for i in {0..9}
do

echo $i
rm -f -r target_md_"$b"_"$i"
mkdir target_md_"$b"_"$i"
cd target_md_"$b"_"$i"


# int1 based
cp ../../master_tmd/* .
cp ../target_cg_resmapped_"$i"_"$b"_box.pdb .
cp ../target_cg_resmapped_"$i"_"$b"_box_proa.pdb .
cp ../target_cg_resmapped_"$i"_"$b"_box_prob.pdb .
sed s/XXXX/$i/g  initrmsd_plumed.dat > temp.dat
sed s/BBBB/$b/g temp.dat > temp2.dat
mv temp2.dat  initrmsd_plumed.dat
rm -f temp.dat

# NOTE: equil-int1-7.gro can be obtained from https://github.com/tamarabidone/multiscale-model-alphaIIbBeta3.
# ALSO see: all-atom directory.
echo "gmx grompp -f run_init.mdp -c ../../all-atom/intermediate1_ff/equil/equil-int1-7.gro -p ../../all-atom/intermediate1_ff/topol.top -po run_init-out.mdp -o run_init.tpr" >> taac-init_run.sbatch
echo -e "\n" >> taac-init_run.sbatch
echo "gmx mdrun -s run_init.tpr -deffnm run_init-tmd -plumed initrmsd_plumed.dat" >> taac-init_run.sbatch

sbatch taac-init_run.sbatch

rm -f *#

cd ..

done

done

cd ..

done
