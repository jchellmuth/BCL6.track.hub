# For the track hub that is to be produced here, only data at the BCL6 locus is of interest. Furthermore, to be able to host this track hub on github, size had to be minimzed as far as possible. 
# To reduce bigiwigs, I will convert to bedgraph and back and strip the data down to the BCL6 locus along the way

# renomae some samples:
mv LY7_CTCF_fc_ENCFF455RLT.bigWig LY7_CTCF_fc_ENCFF455RLT.bw
mv LY7_H3K27ac_fc_ENCFF787GTX.bigWig LY7_H3K27ac_fc_ENCFF787GTX.bw
mv LY7_H3K4me3_fc_ENCFF852DRP.bigWig LY7_H3K4me3_fc_ENCFF852DRP.bw
mv LY7_DNAse_r1_ENCFF506FHA.bigWig LY7_DNAse_r1_ENCFF506FHA.bw
mv LY7_H3K4me1_fc_ENCFF583VZK.bigWig LY7_H3K4me1_fc_ENCFF583VZK.bw

for bw in *.bw; do
echo $bw
bigWigToBedGraph $bw ${bw}.bg -chrom=chr3 -start=187700000 -end=188300000
bedGraphToBigWig ${bw}.bg ~/scratch/reference_files/UCSC/hg38.chrom.sizes ${bw}
done


scp -r jch2004@aphrodite.med.cornell.edu:/home/jch2004/scratch/aws/BCL6-LCR_pub-tracks_new ~/Desktop

hub BCL6-LCR-hub_jchellmuth
shortLabel Chu & Hellmuth et al.
longLabel Chu & Hellmuth et al. Unique immune cell coactivators specify locus control region function and cell stage
genomesFile genomes.txt
email jch2004@med.cornell.edu