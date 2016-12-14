#!/bin/bash

FILE=~/rsID2Bed/snp149Common.bed
DIR=~/rsID2Bed

#check if working folder exist, if not, create

if [ ! -d $DIR ]
then
mkdir ~/rsID2Bed
fi

cd ~/rsID2Bed

#check if dbsnp file exists, if not, download from snp147Common table using mysql

if [ ! -f $FILE ]
then
mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -N -D hg19 -e 'SELECT chrom, chromStart, chromEnd, name FROM snp147Common' > snp147Common.bed
fi

#find positions of snps from the input list by comparing to snpdb

awk -F " " 'BEGIN{while(getline<"$1") a[$1]=1 } ; a[$4] ==1 {print $0 } ' snp138_short.txt > $1.bed

