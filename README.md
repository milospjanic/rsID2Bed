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
rs575272151
rs62028691
rs546169444
rs541940975
rs4690
rs201327123
rs11586607
rs62636497
rs369786760
rs143379270
rs764954080
rs762420258

./rsID2Bed.sh SNP.file

cat SNP.file.bed

chr1	11007	11008	rs575272151
chr1	13117	13118	rs62028691
chr1	14463	14464	rs546169444
chr1	14603	14604	rs541940975
chr1	14672	14673	rs4690
chr1	14676	14677	rs201327123
chr1	15210	15211	rs11586607
chr1	15273	15274	rs62636497
chrX	155258430	155258431	rs369786760
chrX	155258653	155258654	rs143379270
chrX	155259767	155259767	rs764954080
chrX	155259783	155259783	rs762420258
chrY	59361436	59361437	rs369786760
chrY	59361659	59361660	rs143379270
chrY	59362773	59362773	rs764954080
chrY	59362789	59362789	rs762420258
</pre>
