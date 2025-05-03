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

# Include additional genomes associated with sponges, as identified in the literature (Timing variable)

– Seven genomes obtained in our previous studies (doi: 10.1101/2025.03.15.643485), along with 10 genomes from published sources (dois: 10.1038/s41396-020-00791-z, 10.1128/mbio.01577-21, and 10.1038/s41598-024-56480-w) and 3 genomes from unpublished data provided by the Koltzov Institute of Developmental Biology, Russian Academy of Sciences, which were absent from the GTDB database, were manually added to the set of 1,626 genomes.

|ID   |GTBD Release 10-RS226 (16th April 2025)                                                                         |Sponge Name         |Type| Reference (doi)         |
|-----|----------------------------------------------------------------------------------------------------------------|--------------------|----|-------------------------|
|OTU1	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__Persebacter;s__|Isodictya palmata   |LMA |10.1101/2025.03.15.643485|
|OTU14|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Poriferisulfidales; f__;g__;s__	                       |Halichondria sitiens|LMA |10.1101/2025.03.15.643485|
|OTU3	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Arenicellales; f__;g__;s__	                           |Halichondria sitiens|LMA |10.1101/2025.03.15.643485|
|OTU7	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Pseudomonadales; f__Azotimanducaceae;g__UBA9659;s__	   |Halichondria sitiens|LMA |10.1101/2025.03.15.643485|
|OTU9	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Porifericomitales; f__Porifericomitaceae;g__;s__	     |Halichondria sitiens|LMA |10.1101/2025.03.15.643485|
|OTU23|d__Bacteria;p__Pseudomonadota; c__Alphaproteobacteria;o__Puniceispirillales; f__UBA1172;g__JAGWAQ01;s__	       |Halichondria panicea|LMA |10.1101/2025.03.15.643485|
|OTU4	|d__Bacteria;p__Pseudomonadota; c__Alphaproteobacteria;o__Rhodobacterales; f__Rhodobacteraceae;g__Amylibacter;s__|Halichondria panicea|LMA |10.1101/2025.03.15.643485|

# Add type HMA / LMA for sponge based on literature (Timing variable)

– If at least three studies on species within a genus, or three independent examples, consistently indicated a specific type, that type was assigned to the entire genus. 

– Lissodendoryx nobilis was classified as ND (Not Determined), as it was identified as LMA (Low Microbial Abundance) in two studies (doi: 10.1371/journal.pone.0091092, doi.org/10.1016/j.dsr.2024.104416) and as HMA (High Microbial Abundance) in one study (doi: 10.4014/jmb.1406.06041).

– A total of 1,626 genomes were associated with sponges (88 were labeled as Porifera sp., while the others were identified to more specific taxonomic levels). Among these, 1,074 genomes (from 41 sponge species) were classified as HMA (High Microbial Abundance), 308 genomes (from 46 sponge species) as LMA (Low Microbial Abundance), and 244 genomes (from 50 sponge species) as ND (Not Determined).

|Sponge Name                  |Genomes count|Type| Reference (doi)                                |
|-----------------------------|-------------|----|------------------------------------------------|
|Agelas oroides               |50	          |HMA |10.1093/femsec/fiv115                           |
|Agelas tubulata              |1            |HMA |10.1128/mBio.01577-21                           |
|Aplysina aerophoba           |67	          |HMA |10.1086/BBLv227n1p78                            |
|Aplysina fistularis          |4            |HMA |10.1086/BBLv227n1p78                            |
|Aplysina fulva	              |1	          |HMA |10.1007/s00442-007-0910-0                       |
|Chondrilla nucula	          |2	          |HMA |10.1093/femsec/fiv115                           |
|Chondrosia reniformis        |2	          |HMA |10.1093/femsec/fiv115                           |
|Coscinoderma mathewsi        |80	          |HMA |10.1038/s41598-018-26641-9                      |
|Craniella sp.	              |1	          |HMA |10.3389/fmars.2022.841806                       |
|Cymbastela coralliophila	    |1	          |HMA |10.1038/s41598-018-26641-9                      |
|Diacarnus erythraeanus	      |1	          |HMA |10.1002/lno.12361                               |
|Geodia barretti         	    |1	          |HMA |10.1038/s41598-020-74670-0                      |
|Geodia parva	                |62           |HMA |Based on species from the same genus.                |
|Geodia sp.	                  |1            |HMA |Based on no fewer than three species from this genus.|
|Ircinia campana         	    |9           	|HMA |10.3389/fmars.2021.665789                       |
|Ircinia felix	              |45	          |HMA |10.1007/s00442-007-0910-0                       |
|Ircinia ramosa	              |154          |HMA |10.1128/mBio.01577-21                           |
|Ircinia reteplana      	    |37           |HMA |Based on species from the same genus.                |
|Ircinia sp.	                |116          |HMA |Based on no fewer than three species from this genus.|
|Ircinia strobilina	          |12           |HMA |10.1007/s00442-007-0910-0                       |
|Ircinia variabilis	          |1	          |HMA |10.1093/femsec/fiv115                           |
|Lissodendoryx isodictyalis   |2            |HMA |10.4014/jmb.1406.06041                          |
|Melophlus sp.	              |1	          |HMA |10.1128/mBio.01577-21                           |
|Penares incrustans	          |1            |HMA |10.4014/jmb.1406.06041                          |
|Petrosia ficiformis	        |88           |HMA |10.1093/femsec/fiv115                           |
|Plakortis simplex	          |2            |HMA |Based on species from the same genus.                |
|Plakortis sp.	              |1	          |HMA |10.1007/s00442-007-0910-0                       |
|Pseudoceratina sp.	          |5	          |HMA |10.1128/mBio.01577-21                           |
|Rhabdastrella globostellata	|2	          |HMA |10.3389/fmicb.2017.00752                        |
|Rhopaloeides odorabile	      |109	        |HMA |10.3389/fmicb.2017.00752                        |
|Sarcotragus spinosulus	      |4	          |HMA |10.1093/femsec/fiv115                           |
|Spongia barbara	            |1	          |HMA |Crouch, Barbara C. Survival and Growth of Sponge Recruits in a Land-Based Nursery. MS thesis. Florida Atlantic University, 2022.|
|Spongia officinalis	        |90	          |HMA |10.1093/femsec/fiv115                           |
|Spongia sp.	                |18	          |HMA |Based on no fewer than three species from this genus.|
|Theonella swinhoei	          |9	          |HMA |10.1007/s00338-024-02568-8                      |
|Thoosa mismalolli	          |3	          |HMA |10.1038/s41598-025-85622-x                      |
|Verongula gigantea	          |1	          |HMA |10.1086/BBLv227n1p78                            |
|Xestospongia bergquistia	    |62	          |HMA |Based on species from the same genus.                |
|Xestospongia muta	          |24	          |HMA |10.1007/s00442-007-0910-0                       |
|Xestospongia sp.	            |2	          |HMA |Based on no fewer than three species from this genus.|
|Xestospongia testudinaria	  |1	          |HMA |10.1093/femsec/fiz169                           |
|Acanthella acuta             |1	          |LMA |10.1086/BBLv227n1p78                            |
|Amphimedon queenslandica 	  |3	          |LMA |10.1128/mBio.01577-21                           |
|Aphrocallistes beatrix       |1	          |LMA |10.1093/ismejo/wrae197                          |
|Axinella damicornis          |7	          |LMA |10.1093/femsec/fiv115                           |
|Axinella dissimilis          |1	          |LMA |Based on species from the same genus.                |
|Axinella polypoides	        |2	          |LMA |10.1086/BBLv227n1p78                            |
|Axinella sp.                 |1	          |LMA |Based on no fewer than three species from this genus.|
|Axinella verrucosa           |1	          |LMA |10.12688/openreseurope.19755.1                 |
|Callyspongia serpentina      |2          	|LMA |Based on species from the same genus.                |
|Callyspongia sp.             |5          	|LMA |10.1093/femsec/fiv115                           |
|Carteriospongia foliascens   |1	          |LMA |10.1007/s00338-024-02568-8                      |
|Clathria eurypa              |1	          |LMA |Based on species from the same genus.                |
|Cliona orientalis            |5	          |LMA |10.1098/rspb.2019.2153                          |
|Coelocarteria singaporensis  |11	          |LMA |10.1128/mBio.01577-21                           |
|Crambe crambe                |1	          |LMA |10.1128/mBio.01577-21                           |
|Crella incrustans	          |1	          |LMA |10.1128/mBio.01577-21                           |
|Cymbastela concentrica	      |1	          |LMA |10.1093/femsec/fiv115                           |
|Dysidea tupha                |1	          |LMA |Based on species from the same genus.                |
|Halichondria bowerbanki      |1	          |LMA |Based on species from the same genus.                |
|Halichondria okadai          |1	          |LMA |Based on species from the same genus.                |
|Halichondria panicea         |19	          |LMA |doi: 10.1093/femsec/fiv115                           |
|Halichondria sp.             |1	          |LMA |Based on no fewer than three species from this genus.|
|Haliclona cymaeformis        |1	          |LMA |10.1007/s00338-024-02568-8                      |
|Haliclona oculata            |25         	|LMA |Based on species from the same genus.                |
|Haliclona sp.                |3	          |LMA |Based on no fewer than three species from this genus.|
|Haliclona xena               |3	          |LMA |10.1111/1574-6941.12400                         |
|Halisarca caerulea           |1	          |LMA |10.1002/lno.11384                               |
|Hymeniacidon sinapium        |3          	|LMA |10.1093/femsec/fiv115                           |
|Hymeniacidon sp.             |3          	|LMA |Based on no fewer than three species from this genus.|
|Ianthella basta              |8	          |LMA |10.3389/fmicb.2017.00752                        |
|Lamellodysidea herbacea      |16	          |LMA |10.1007/s00338-024-02568-8                      |
|Mycale adhaerens             |1	          |LMA |Based on species from the same genus.                |
|Mycale hentscheli            |27	          |LMA |10.1093/femsec/fiv115                           |
|Mycale phyllophila           |4	          |LMA |Based on species from the same genus.                |
|Mycale sp.                   |1	          |LMA |Based on no fewer than three species from this genus.|
|Ophlitaspongia papilla       |2	          |LMA |10.1371/journal.pone.0080653                    |
|Oscarella lobularis          |16          	|LMA |10.1086/BBLv227n1p78                            |
|Pione vastifica              |1	          |LMA |10.1016/j.sjbs.2019.05.002                      |
|Phakellia elegans            |1	          |LMA |Based on species from the same genus.                |
|Phyllospongia foliascens     |40         	|LMA |10.1007/s00338-024-02568-8                      |
|Polymastia sp.               |2	          |LMA |10.1111/j.1574-6941.2012.01467.x                |
|Stylissa flabelliformis      |11         	|LMA |10.1016/j.scitotenv.2024.17017                  |
|Tedania ignis                |1	          |LMA |10.1086/BBLv227n1p78                            |
|Tethya californiana          |2         	  |LMA |Based on species from the same genus.                |
|Tethya sp.                   |1         	  |LMA |10.1080/14772000.2024.2383341                   |
|Vazella pourtalesii          |67	          |LMA |10.1038/s41598-020-74670-0                      |
|Aiolochroia sp.              |12	          |ND  |                                                     |
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
