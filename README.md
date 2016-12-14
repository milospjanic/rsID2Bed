# rsID2Bed

rsID2Bed is a script to convert SNP rsIDs to a list of genomics positions in a bed format: chr, position, position+1, rsID. Script is useful for quick conversion of SNPs to a bed format for downstream analysis (e.g. overlaps with bedtools).

**Usage**

This script will check if the working folder is present and if not it will create ~/rsID2Bed. Next, script will go into ~/rsID2Bed and check if dbSNP bed file for human genome hg19 is present or not, version 147 (the latest one present in the mySQL database currently), and case it is not present it will download it using mySQL from snp147Common table of hg19 dataset on genome-mysql.cse.ucsc.edu.

Next an akw code will perform comparison and output bed file for your input snps and save it as $1.bed, $1 being first parameter provided to the script that should be the file name containing SNPs.

Output file will be placed in ~/rsID2Bed

**Running**

To run the script type:
<pre>
chmod 775 rsID2Bed.sh 
./rsID2Bed.sh path/to/file
</pre>

**Example**

<pre> 
cat SNP.file
rs376643643
rs373328635
rs376007522
rs368469931
rs144773400
rs375931351
rs371194064
rs201752861
rs367896724
rs201694901

./rsID2Bed.sh SNP.file

cat SNP.file.bed

