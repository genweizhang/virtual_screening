#!/bin/bash
#SBATCH --partition=64gb_24core
#SBATCH --exclusive
#SBATCH --ntasks=24
#SBATCH --ntasks-per-node=24
#SBATCH --mem=0
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --time=10:00:00
#SBATCH --job-name=docking

# input variables
export SEEDFILE="job_id.index" 
export STATUS="/home/genweizhang/raccoon/data//Bax_virtual_screening/Virtual_Screen/Bax_protein_only--library_2/status.log" 
export CONFIG="/home/genweizhang/raccoon/data//Bax_virtual_screening/Virtual_Screen/Bax_protein_only--library_2/docking.conf" 
# end input data

ID=`seq 1 1597`
/home/panxl/.local/bin/parallel --workdir ${SLURM_SUBMIT_DIR} --progress -P ${SLURM_NTASKS} ./run_docking.sh ::: $ID
