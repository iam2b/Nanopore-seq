#!/bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -V
#$ -l s_vmem=64G
#$ -l mem_req=64G

minimap2 -ax splice -uf -k14 /lustre7/home/lustre4/akimitsu-lab/database/genome/hg38/hg38.fa   #reference in .fa format
./190730_1_siCTRL/siCTRL_1d_pass.fastq > ./190730_1_siCTRL/siCTRL_1d_pass.sam                  #.fastq > .sam

samtools view -b -S siCTRL_1d_pass.sam > siCTRL_1d_pass.bam                                    #.sam > .bam
samtools sort siCTRL_1d_pass.bam -o siCTRL_1d_pass_sorted.bam                                  # sort bam files
samtools index siCTRL_1d_pass.bam                                                              #.bam index
