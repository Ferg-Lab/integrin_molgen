for x in bent-int1 bent-int2 bent-open int1-int2 int1-open int2-open
do
cd $x
for j in 0 1 2 3 4 5 6 7 8 9
do
#rm -f -r target_md_int1_$j
#mkdir target_md_int1_$j
rsync -av --exclude "target_cg_resmapped_*_box.pdb" --exclude target_cg_resmapped_*pro*.pdb --exclude "*.tpr" --exclude "*rmsd_a_results.dat" --exclude "*.gro" --exclude "*.xtc" --exclude "*.log" --exclude "*.o*" --exclude "*.e*" --exclude "*.ndx" --exclude "*.cpt" --exclude "*.sbatch" --exclude "*.edr" --exclude "*out.mdp" --exclude "*.sh" ../../../../analysis-integrin/multiple_fake_points_integrin/$x/target_md_int1_$j .

#gmx editconf -f ../../../analysis-integrin/multiple_fake_points_integrin/$x/target_md_int1_$j/target_cg_fit_aa.gro -o target_md_int1_$j/target_cg_fit_aa.pdb

#gmx editconf -f ../../../analysis-integrin/multiple_fake_points_integrin/$x/target_md_int1_$j/run-tmd-aa.gro -o target_md_int1_$j/run-tmd-aa.pdb

done
cd ..
done

