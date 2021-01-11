# This script downloads all the data into extdata directory

# ------------- Description of abrreviations used -------------------
# bc = barcode, kr = krause et al data,  ff = flipflop,
# bc = decoded barcodes, tf = tailfindr predictions,
# np = nanopolish predictions, wo = workman et al data
# dna = DNA data, rna001 = RNA data obtained using RNA001 kit
# rna002 = RNA data obtained using RNA002 kit
# -------------------------------------------------------------------

#####################################################################
# ------------ Download Krause et al DNA data ----------------------#
# Data contains two replicates: one on LSK108 kit and the other on
# LSL109 kit. Apart from containing spikeins of known lengths, the
# data also contains reads from zebrafish transcriptome collected as
# part of the experiment. These reads will be filtered out in
# downstream processing steps
#####################################################################
data_release_version <- 'v1.0.6'
# get barcode information based on data basecalled using flipflop model
rep1_ff_tf =
  get_data(release_version = data_release_version,
           file_name = 'replicate1-flipflop_basecalling-tailfindr_estimations-v1.csv')

rep4_roos_30bp =
  get_data(release_version = data_release_version,
           file_name = 'replicate4-tailfindr_estimations_roos_30bp.csv')

rep4_roos_100bp =
  get_data(release_version = data_release_version,
           file_name = 'replicate4-tailfindr_estimations_roos_100bp.csv')