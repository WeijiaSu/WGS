#!/bin/bash

## Modify this job script accordingly and submit with the command:
##    sbatch HPC.sbatch
#SBATCH --nodes=1   # number of nodes
#BATCH --ntasks-per-node=32   # 16 processor core(s) per node
#SBATCH --job-name='index'
#SBATCH --partition="all"
#SBATCH --mem=100000
#SBATCH --mail-user=weijia.su@duke.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --array=1
#SBATCH --output="index.out"
#SBATCH --error="index.err"
## LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

module load samtools

genome="/data/zhanglab/Weijia_Su/Genomes/Human/hg38.fa"
Ecoli_1="/data/zhanglab/Weijia_Su/Genomes/GCF_000008865.2_ASM886v2_genomic.fna"
Ecoli_2="/data/zhanglab/Weijia_Su/Genomes/GCF_009767665.1_ASM976766v1_genomic.fna"

for i in $genome $Ecoli_1 $Ecoli_2;
do
bwa index $i
done
