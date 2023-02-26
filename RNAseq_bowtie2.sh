### install the following tools following the instructions of their official websites
# BBMap (https://jgi.doe.gov/data-and-tools/software-tools/bbtools/bb-tools-user-guide/installation-guide/) 
# bowtie2 (https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#obtaining-bowtie-2) 
# Samtools: (http://www.htslib.org/)

#Enter the fastq file pathways and output directory (make sure these directories exist and are empty!)

## Change the <path> to your own related directory 
Input_DIR=<path/to/input/files>

Output_DIR=<path/to/store/output/files>


# Define the directory of whole genome databases
db_DIR=<path/to/reference/genome.fna.gz>

# Define the directory to store bowtie_library files
bowtie_ref=<path/to/store/bowtie/references/files>


# Make directories to save results.
mkdir $Output_DIR/bowtie2 

# Make directories for the three reference genome files, and save relevant genome files here before going to the next step
mkdir $db_DIR/SR_new_genome
mkdir $db_DIR/SR_new_genome
mkdir $db_DIR/M1_genome


# Adapter-trimming 
cd $Input_DIR

for fq in *_1.fq.gz
do bbduk.sh in1=$fq in2=${fq%_1.fq.gz}_2.fq.gz out1=$Output_DIR/clean_${fq%.fq.gz}.fq out2=$Output_DIR/clean_${fq%_1.fq.gz}_2.fq ref=adapters.fa ktrim=N k=23 mink=11 hdist=1 tpe tbo
done

## I checked the sequence quality and there is nothing below quality score of 10, thus skipped the Quality filter. However, quality trimming can be conducted via 
	## bbduk.sh in=<reads.fq.gz> out=<clean.fq.gz> qtrim=r trimq=10 # Change parameters according to your own dataset and need

# use bowtie2 to build reference file 


bowtie2-build -f $db_DIR/SR_new_genome/GCF_000179635.2_ASM17963v2_genomic.fna.gz $bowtie_ref/RA7

bowtie2-build -f $db_DIR/SR_new_genome/GCF_000284095.1_ASM28409v1_genomic.fna.gz $bowtie_ref/SR

bowtie2-build -f $db_DIR/M1_genome/GCF_000024185.1_ASM2418v1_genomic.fna.gz $bowtie_ref/m1


# align RNA seq files with reference genomes
cd $Output_DIR
mkdir bam_sam_m1
mkdir bam_sam_RA7
mkdir bam_sam_SR

for i in clean_*_1.fq
do bowtie2 -x $bowtie_ref/m1 -1 $i -2 ${i%_1.fq}_2.fq --un bam_sam_m1/${i%_1.fq}_unaligned.fq -p 8 -S $Output_DIR/bam_sam_m1/${i%_1.fq}.sam

done

for i in clean_*_1.fq
do bowtie2 -x $bowtie_ref/RA7 -1 $i -2 ${i%_1.fq}_2.fq --un bam_sam_RA7/${i%_1.fq}_unaligned.fq -p 8 -S $Output_DIR/bam_sam_RA7/${i%_1.fq}.sam

done

for i in clean_*_1.fq
do bowtie2 -x $bowtie_ref/SR -1 $i -2 ${i%_1.fq}_2.fq --un bam_sam_SR/${i%_1.fq}_unaligned.fq -p 8 -S $Output_DIR/bam_sam_SR/${i%_1.fq}.sam

done

cd bam_sam_m1 
for s in *.sam
do samtools sort -O bam -@4 $s -o ${s%.sam}_bowtie2.bam
done  

for b in *.bam
do samtools index $b ${b}.bai
done


cd bam_sam_RA7 
for s in *.sam
do samtools sort -O bam -@4 $s -o ${s%.sam}_bowtie2.bam
done  

for b in *.bam
do samtools index $b ${b}.bai
done


cd bam_sam_SR 
for s in *.sam
do samtools sort -O bam -@4 $s -o ${s%.sam}_bowtie2.bam
done 

for b in *.bam
do samtools index $b ${b}.bai
done

# the .bam and .bai files will be used in downstream analyses to conduct differential expression analyses in R.