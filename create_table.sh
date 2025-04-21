#!/bin/bash

# Start overall timer
START_TIME=$(date +%s)
echo "=== Pipeline started at: $(date) ==="

########################################################################
echo -e "\n[1/5] Download and decompress..."
TS=$(date +%s)

#Download and decompress gzip files from GTDB (bac120_metadata_r226.tsv.gz, 2025-04-08 13:37, 225 MB; bac120_r226.tree.gz, 2025-04-08 13:38, 1.6 MB) and NCBI (biosample_set.xml.gz, 3.2 GB).
wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release226/226.0/bac120_r226.tree.gz
wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release226/226.0/bac120_metadata_r226.tsv.gz
wget https://ftp.ncbi.nih.gov/biosample/biosample_set.xml.gz
gunzip *.gz

#######################################################################
echo -e "\n[2/5] Extracting representative genomes..."
TS=$(date +%s)

# Extract representative genomes from the metadata file
cat bac120_metadata_r226.tsv | awk -F'\t' '{if($19 == "t") print $53"\t"$1"\t"$20}' > tmp

# Column descriptions:
# $19 - gtdb_representative (true/false)
# $53 - ncbi_biosample
# $1 - accession
# $20 - gtdb_taxonomy

TE=$(date +%s)
echo "Step completed in $((TE - TS)) seconds"
########################################################################
echo -e "\n[3/5] Parssing BioSample xml data..."
TS=$(date +%s)

# Parse BIOSAMPLE XML data
python3 ./parser_biosample_xml.py

# Extract sponge-related information
# Output files:
# biosample_sponge_matches.tsv - BioSample ID (col1) and sponge-associated info (col2)
# biosample_log.tsv - BioSample IDs (col1)

TE=$(date +%s)
echo "Step completed in $((TE - TS)) seconds"
########################################################################
echo -e "\n[4/5] Combining data tables..."
TS=$(date +%s)

# Combine data tables
./table_combiner.sh biosample_sponge_matches.tsv tmp tmp2

# Filter and format data
cat tmp2 | awk -F'\t' '{if ($4 != "ND") print $2"\t"$3"\t"$4}' > tmp3
cat tmp2 | awk -F'\t' '{if ($4 == "ND") print $2"\t"$3"\t"$4"\t""ND"}' > tmp4

TE=$(date +%s)
echo "Step completed in $((TE - TS)) seconds"
########################################################################
echo -e "\n[5/5] Add sponge species and creating final table..."
TS=$(date +%s)

# Add sponge species
./add_sponge.sh tmp3 > tmp5

# Prepare final table
cat tmp5 | awk -F'\t' '{print $2"\t"$3"\t"$1"\t"$4}' > tmp6
cat tmp6 tmp4 > table.tsv

# Final table structure:
# 1st column - GTDB accession
# 2nd column - GTDB taxonomy
# 3rd column - Sponge species (derived from column 4)
# 4th column - Data from biosample_set.xml

TE=$(date +%s)
echo "Step completed in $((TE - TS)) seconds"
########################################################################
# Clean up temporary files
rm tmp*

