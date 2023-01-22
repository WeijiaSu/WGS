#!/bin/bash

## Modify this job script accordingly and submit with the command:
##    sbatch HPC.sbatch
#SBATCH --nodes=5   # number of nodes
#BATCH --ntasks-per-node=32   # 16 processor core(s) per node
#SBATCH --job-name='map_Ecoli'
#SBATCH --partition="all"
#SBATCH --mem=100000
#SBATCH --mail-user=weijia.su@duke.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --array=1-5%5
#SBATCH --output="map_Ecoli_%A_%a.out"
#SBATCH --error="map_Ecoli_%A_%a.err"
## LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

module load samtools

dir="/data/zhanglab/Weijia_Su/illumina_Raw_Data/Shun_111822/"

arrayfile=`ls $dir | awk -v line=$SLURM_ARRAY_TASK_ID '{if (NR == line) print $0}'`
echo $arrayfile

bash Mapping_E.coli.sh $arrayfile

