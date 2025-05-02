# create_table.sh (Timing < 1.5 h)

– Download and decompress gzip files from GTDB (bac120_metadata_r226.tsv.gz, 2025-04-08 13:37, 225 MB; bac120_r226.tree.gz, 2025-04-08 13:38, 1.6 MB) and NCBI (biosample_set.xml.gz, 3.2 Gb).

– Extracting representive genomes from bac120_metadata_r226.tsv (GTDB).

– Extracting sponge -related information from biosample_set.xml (NCBI).

– Combining data tables.

– Add sponge species.

Output file - table.tsv (1st column - GTDB accession; 2nd column - GTDB taxonomy; 3rd column - Sponge species (derived from column 4); 4th column - Data from biosample_set.xml). If the NCBI XML for a given sample does not contain any mention of ‘sponge’, ‘Sponge’, ‘porifera’, or ‘Porifera’, the fourth column will contain the note: ‘No information about sponge in XML from NCBI’ (135,018 rows). Otherwise, the fourth column will contain the full relevant text extracted from the NCBI XML (1,628 rows). In the third column, if the fourth column contains ‘No information about sponge in XML from NCBI’, the value will be ‘Not sponge’. If the fourth column contains information, the third column will display the name of the sponge species extracted from the fourth column. If the fourth column contains information, but no specific sponge name is found, the default assignment ‘Porifera sp.’ will be used.

# Host information was manually curated using the information from BioProject descriptions and original publications (Timing variable)

– An additional genome, RS_GCF_001078595.1 (SAMN03777540), was included because, although the XML block for this ID does not mention ‘Sponge’, ‘sponge’, ‘porifera’, or ‘Porifera’, the host organism is a sponge—Oscarella lobularis.

– Remove the three samples, as they are not marine sponges: RS_GCF_023370115.1 (SAMN28097950), RS_GCF_026420865.1 (SAMN31422749), RS_GCF_040538665.1 (SAMN38848338)”

– We are uncertain whether the sample GB_GCA_008364785.1 represents a marine sponge or a sponge of another habitat, as the XML description only refers to it as ‘sponge’, while the associated geographic coordinates correspond to a terrestrial location. Nevertheless, we chose to retain this sample.

– As stated above, if information is present in the fourth column but no species name is identified, the sample is assigned the label Porifera sp.. Manual inspection allowed us to identify 85 specific sponge names. The remaining 89 samples remain labeled as Porifera sp.

– The identified names were checked for correctness, and any trailing spaces were removed. A comparison between the two tables allows for the detection of all manual corrections.



# Add type HMA / LMA for sponge based on literature (Timing variable)

A total of 1,626 genomes were associated with sponges (88 were labeled as Porifera sp., while the others were identified to more specific taxonomic levels). Among these, 1,074 genomes (from 41 sponge species) were classified as HMA (High Microbial Abundance), 308 genomes (from 46 sponge species) as LMA (Low Microbial Abundance), and 244 genomes (from 50 sponge species) as ND (Not Determined).


|Sponge Name       |Genomes count|Type| Reference                 |
|------------------|-------------|----|---------------------------|
|Agelas oroides    |50	         |HMA |doi: 10.1093/femsec/fiv115 |
|Agelas tubulata   |1            |HMA |doi: 10.1128/mBio.01577-21 |
|Aplysina aerophoba|67	         |HMA |doi: 10.1086/BBLv227n1p78  |

The input file is table.tsv, generated in the previous step. The resulting output is saved to table2.tsv.
