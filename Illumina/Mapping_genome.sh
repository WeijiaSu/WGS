#!/bin/bash



genome="/data/zhanglab/Weijia_Su/Genomes/Human/hg38.fa"
Ecoli_1="/data/zhanglab/Weijia_Su/Genomes/GCF_000008865.2_ASM886v2_genomic.fna"
Ecoli_2="/data/zhanglab/Weijia_Su/Genomes/GCF_009767665.1_ASM976766v1_genomic.fna"
dir="/data/zhanglab/Weijia_Su/illumina_Raw_Data/Shun_111822/"
data=$1


#cat $dir$data"/"*HK7JMDSX5*"_1.fq" $dir$data"/"*HKC25DSX5*"_1.fq" > $dir$data"/"$data"_1.fq"
#cat $dir$data"/"*HK7JMDSX5*"_2.fq" $dir$data"/"*HKC25DSX5*"_2.fq" > $dir$data"/"$data"_2.fq"

for ref in $genome;
do
reads1=$dir$data"/"$data"_1.fq"
reads2=$dir$data"/"$data"_2.fq"
echo $reads1;
echo $reads2;
refName=$(basename $ref)
echo "`date +"%m-%d-%Y %H:%M:%S"` Mapping to" $refName $d;
bwa mem $ref $reads1 $reads2 | samtools view -bS | samtools sort -T $refName"_"$data > $refName"_"$data".bam" 
echo "`date +"%m-%d-%Y %H:%M:%S"` Indexing";
samtools index $refName"_"$data".bam";
echo "`date +"%m-%d-%Y %H:%M:%S"` Stats";
samtools stats $refName"_"$data".bam" | head -n 30 > $refName"_"$data".bam.stats"
echo "`date +"%m-%d-%Y %H:%M:%S"` Coverage";
bamCoverage -b $refName"_"$data".bam" -o $refName"_"$data".bam.bw";
echo "`date +"%m-%d-%Y %H:%M:%S"` ToBed";
bedtools bamtobed -i $refName"_"$data".bam" > $refName"_"$data".bam.bed"
done

