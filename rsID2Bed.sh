#!/bin/bash

FILE=~/rsID2Bed/snp149Common.bed

if 
then
mkdir ~/rsID2Bed
fi

cd ~/rsID2Bed

if [ ! -f $FILE ]
then
mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -N -D hg19 -e 'SELECT chrom, chromStart, chromEnd, name FROM snp149Common' > snp149Common.bed
fi
