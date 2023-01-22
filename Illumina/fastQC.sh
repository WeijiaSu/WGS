#!/bin/bash


dir="/data/zhanglab/Weijia_Su/illumina_Raw_Data/Shun_011923/01.RawData/"
sample=$1

mkdir $sample
mkdir $sample"_tem"

read1=$dir$sample"/"*_1.fq.gz
read2=$dir$sample"/"*_2.fq.gz
echo $read1
echo $read2

fastqc -o $sample -d $sample"_tem" $read1;
fastqc -o $sample -d $sample"_tem" $read2;
