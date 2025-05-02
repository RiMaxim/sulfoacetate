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

– If at least three studies on species within a genus, or three independent examples, consistently indicated a specific type, that type was assigned to the entire genus. 

– Lissodendoryx nobilis was classified as ND (Not Determined), as it was identified as LMA (Low Microbial Abundance) in two studies (doi: 10.1371/journal.pone.0091092, doi.org/10.1016/j.dsr.2024.104416) and as HMA (High Microbial Abundance) in one study (doi: 10.4014/jmb.1406.06041).

– A total of 1,626 genomes were associated with sponges (88 were labeled as Porifera sp., while the others were identified to more specific taxonomic levels). Among these, 1,074 genomes (from 41 sponge species) were classified as HMA (High Microbial Abundance), 308 genomes (from 46 sponge species) as LMA (Low Microbial Abundance), and 244 genomes (from 50 sponge species) as ND (Not Determined).

|Sponge Name                  |Genomes count|Type| Reference                                           |
|-----------------------------|-------------|----|-----------------------------------------------------|
|Agelas oroides               |50	          |HMA |doi: 10.1093/femsec/fiv115                           |
|Agelas tubulata              |1            |HMA |doi: 10.1128/mBio.01577-21                           |
|Aplysina aerophoba           |67	          |HMA |doi: 10.1086/BBLv227n1p78                            |
|Aplysina fistularis          |4            |HMA |doi: 10.1086/BBLv227n1p78                            |
|Aplysina fulva	              |1	          |HMA |doi: 10.1007/s00442-007-0910-0                       |
|Chondrilla nucula	          |2	          |HMA |doi: 10.1093/femsec/fiv115                           |
|Chondrosia reniformis        |2	          |HMA |doi: 10.1093/femsec/fiv115                           |
|Coscinoderma mathewsi        |80	          |HMA |doi: 10.1038/s41598-018-26641-9                      |
|Craniella sp.	              |1	          |HMA |doi: 10.3389/fmars.2022.841806                       |
|Cymbastela coralliophila	    |1	          |HMA |doi: 10.1038/s41598-018-26641-9                      |
|Diacarnus erythraeanus	      |1	          |HMA |doi: 10.1002/lno.12361                               |
|Geodia barretti         	    |1	          |HMA |doi: 10.1038/s41598-020-74670-0                      |
|Geodia parva	                |62           |HMA |Based on species from the same genus.                |
|Geodia sp.	                  |1            |HMA |Based on no fewer than three species from this genus.|
|Ircinia campana         	    |9           	|HMA |doi: 10.3389/fmars.2021.665789                       |
|Ircinia felix	              |45	          |HMA |doi: 10.1007/s00442-007-0910-0                       |
|Ircinia ramosa	              |154          |HMA |doi: 10.1128/mBio.01577-21                           |
|Ircinia reteplana      	    |37           |HMA |Based on species from the same genus.                |
|Ircinia sp.	                |116          |HMA |Based on no fewer than three species from this genus.|
|Ircinia strobilina	          |12           |HMA |doi: 10.1007/s00442-007-0910-0                       |
|Ircinia variabilis	          |1	          |HMA |doi: 10.1093/femsec/fiv115                           |
|Aiolochroia sp.              |	12	        |ND  |                                                     |
|Anoxycalyx joubini	          |1	          |ND  |                                                     |
|Antho dichotoma	            |3	          |ND  |                                                     |
|Arenosclera brasiliensis	    |2	          |ND  |                                                     |
|Cacospongia mycofijiensis    |1	          |ND  |                                                     |
|Chalinula sp.	              |1	          |ND  |                                                     |
Cinachyrella australiensis    |2          	|ND  |                                                     |
|Cinachyrella kuekenthali	    |1          	|ND  |                                                     |
|Cinachyrella sp.	            |1	          |ND  |                                                     |
|Clathrina clathrus	          |1	          |ND  |                                                     |
|Corticium candelabrum	      |31	          |ND  |                                                     |
|Demospongiae sp.	            |4	          |ND  |                                                     |
|Diacarnus megaspinorhabdosa	|1	          |ND  |                                                     |
|Discodermia calyx	          |2	          |ND  |                                                     |
|Ephydatia muelleri	          |5	          |ND  |                                                     |
|Ephydatia sp.	              |1	          |ND  |                                                     |
|Eunapius fragilis	          |8	          |ND  |                                                     |
|Fascaplysinopsis reticulata	|1	          |ND  |                                                     |
|Forcepia sp.	                |1	          |ND  |                                                     |
|Haliclonissa verrucosa	      |1           	|ND  |                                                     |
|Haplosclerida sp.	          |5	          |ND  |                                                     |
|Hexactinellida sp.	          |2	          |ND  |                                                     |
|Hyattella lendenfeldi	      |1	          |ND  |                                                     |
|Hymedesmia methanophila	    |1	          |ND  |                                                     |
|Iophon methanophila	        |1	          |ND  |                                                     |
|Iophon sp.                   |2	          |ND  |                                                     |
|Iotrochota sp	              |1            |ND  |                                                     |
|Leiodermatium sp.	          |1          	|ND  |                                                     |
|Lissodendoryx nobilis  	    |1          	|ND  |                                                     |
|Lophophysema sp.	            |2          	|ND  |                                                     |
|Myxilla sp.	                |1          	|ND  |                                                     |
|Neamphius huxleyi            |4          	|ND  |                                                     |
|Pandaros acanthifolium	      |1          	|ND  |                                                     |
|Pheronema carpenteri	        |2          	|ND  |                                                     |
|Poecillastra wondoensis      |1          	|ND  |                                                     |
|Poecilosclerida sp.	        |2          	|ND  |                                                     |
|Porifera sp.	                |88	          |ND  |                                                     |
|Pseudaxinella sp.	          |1          	|ND  |                                                     |
|Sarcotragus foetidus	        |1	          |ND  |                                                     |
|Spheciospongia confoederata	|1          	|ND  |                                                     |
|Spheciospongia panis	        |1          	|ND  |                                                     |
|Spongilla lacustris	        |19         	|ND  |                                                     |
|Spongilla sp.	              |17         	|ND  |                                                     |
|Suberites sp.	              |1          	|ND  |                                                     |
|Sycon capricorn	            |1          	|ND  |                                                     |
|Sycon ciliatum	              |1          	|ND  |                                                     |
|Tedania charcoti	            |1          	|ND  |                                                     |
|Tedania sp.	                |1          	|ND  |                                                     |
|Tedaniidae sp.	              |2	          |ND  |                                                     |
|Terpios hoshinota	          |1          	|ND  |                                                     |

The input file, table.tsv, is generated in the first step. The resulting output, filtered in the previous step and annotated with type information in this step, is saved as table2.tsv ((1st column - GTDB accession; 2nd column - GTDB taxonomy; 3rd column - Sponge species (derived from column 4); 4th column - Data from biosample_set.xml; 5th column - type HMA/LMA).
