#!/bin/bash

FILE=~/rsID2Bed/snp147Common.bed
DIR=~/rsID2Bed
SNPS=$(pwd)/$1
echo Proccesing file:
echo $SNPS 

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
awk 'NR==FNR {h[$1] = 1; next} {if(h[$4]==1) print$0}' $SNPS snp147Common.bed > $1.bed
