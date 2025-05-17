# 1. Generate a table using metadata from GTDB and NCBI XML files (Timing < 1.5 h)

– Download and decompress gzip files from GTDB (bac120_metadata_r226.tsv.gz, 2025-04-08 13:37, 225 MB; bac120_r226.tree.gz, 2025-04-08 13:38, 1.6 MB) and NCBI (biosample_set.xml.gz, 3.2 Gb).

– Extracting representive genomes from bac120_metadata_r226.tsv (GTDB).

– Extracting sponge -related information from biosample_set.xml (NCBI).

– Combining data tables.

– Add sponge species.

>Run script ./create_table.sh 

– Output file - [![table.tsv.gz](https://img.shields.io/badge/table.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/table.tsv.gz) (1st column - GTDB accession; 2nd column - GTDB taxonomy; 3rd column - Sponge species (derived from column 4); 4th column - Data from biosample_set.xml). If the NCBI XML for a given sample does not contain any mention of ‘sponge’, ‘Sponge’, ‘porifera’, or ‘Porifera’, the fourth column will contain the note: ‘No information about sponge in XML from NCBI’ (135,018 rows). Otherwise, the fourth column will contain the full relevant text extracted from the NCBI XML (1,628 rows). In the third column, if the fourth column contains ‘No information about sponge in XML from NCBI’, the value will be ‘Not sponge’. If the fourth column contains information, the third column will display the name of the sponge species extracted from the fourth column. If the fourth column contains information, but no specific sponge name is found, the default assignment ‘Porifera sp.’ will be used.

# 2. Host information was manually curated using the information from BioProject descriptions and original publications (Timing variable)

– An additional genome, RS_GCF_001078595.1 (SAMN03777540), was included because, although the XML block for this ID does not mention ‘Sponge’, ‘sponge’, ‘porifera’, or ‘Porifera’, the host organism is a sponge—Oscarella lobularis.

– Remove the three samples, as they are not marine sponges: RS_GCF_023370115.1 (SAMN28097950), RS_GCF_026420865.1 (SAMN31422749), RS_GCF_040538665.1 (SAMN38848338)

– We are uncertain whether the sample GB_GCA_008364785.1 represents a marine sponge or a sponge of another habitat, as the XML description only refers to it as ‘sponge’, while the associated geographic coordinates correspond to a terrestrial location. Nevertheless, we chose to retain this sample.

– As stated above, if information is present in the fourth column but no species name is identified, the sample is assigned the label Porifera sp.. Manual inspection allowed us to identify 85 specific sponge names. The remaining 88 samples remain labeled as Porifera sp.

– The identified names were checked for correctness, and any trailing spaces were removed. A comparison between the two tables allows for the detection of all manual corrections.

– A total of 1,626 genomes were associated with sponges, while 135,020 genomes had no sponge-related information in the XML metadata from NCBI.

# 3. Include additional genomes associated with sponges, as identified in the literature (Timing variable)

– Seven genomes (OTU1, OTU3, OTU7, OTU9, OTU14, OTU4, OTU23) obtained in our previous studies (doi: 10.1101/2025.03.15.643485), along with 10 genomes (ID1, ..., ID10) from published sources (dois: 10.1038/s41396-020-00791-z, 10.1128/mbio.01577-21, and 10.1038/s41598-024-56480-w) and 3 genomes from unpublished data provided by the Koltzov Institute of Developmental Biology, Russian Academy of Sciences, which were absent from the GTDB database, were manually added to the set of 1,626 genomes.

|ID   |GTBD Release 10-RS226 (16th April 2025)                                                                          |Sponge Name                |Type| Reference (doi)          |
|-----|-----------------------------------------------------------------------------------------------------------------|---------------------------|----|--------------------------|
|OTU1	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__Persebacter;s__ |Isodictya palmata          |LMA |10.1101/2025.03.15.643485 |
|OTU3	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Arenicellales; f__;g__;s__	                            |Halichondria sitiens       |LMA |10.1101/2025.03.15.643485 |
|OTU7	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Pseudomonadales; f__Azotimanducaceae;g__UBA9659;s__	    |Halichondria sitiens       |LMA |10.1101/2025.03.15.643485 |
|OTU9	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Porifericomitales; f__Porifericomitaceae;g__;s__	      |Halichondria sitiens       |LMA |10.1101/2025.03.15.643485 |
|OTU14|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Poriferisulfidales; f__;g__;s__	                        |Halichondria sitiens       |LMA |10.1101/2025.03.15.643485 |
|OTU4	|d__Bacteria;p__Pseudomonadota; c__Alphaproteobacteria;o__Rhodobacterales; f__Rhodobacteraceae;g__Amylibacter;s__ |Halichondria panicea       |LMA |10.1101/2025.03.15.643485 |
|OTU23|d__Bacteria;p__Pseudomonadota; c__Alphaproteobacteria;o__Puniceispirillales; f__UBA1172;g__JAGWAQ01;s__	        |Halichondria panicea       |LMA |10.1101/2025.03.15.643485 |
|ID1  |d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__;g__;s__	                          |Tethya stolonifera         |LMA |10.1038/s41396-020-00791-z|
|ID2	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__JAHZKE01;s__	  |Scopalina sp.              |LMA |10.1038/s41396-020-00791-z|
|ID3	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__Persebacter;s__	|Crambe crambe              |LMA |10.1038/s41396-020-00791-z|
|ID4	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__;g__;s__	                          |Coelocarteria singaporensis|HMA |10.1128/mbio.01577-21     |
|ID5	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__;s__	          |Tsitsikamma favus          |LMA |10.1128/mbio.01577-21     |
|ID6	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Tethybacteraceae;g__Tethybacter;s__	|Iophon methanophila        |ND  |10.1128/mbio.01577-21     |
|ID7	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__;g__;s__	                          |Cinachyrella sp.           |ND  |10.1128/mbio.01577-21     |
|ID8	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Tethybacteraceae;g__Tethybacter;s__	|Poridera sp.           |ND  |10.1038/s41598-024-56480-w|
|ID9	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__;s__	          |Poridera sp.           |ND  |10.1038/s41598-024-56480-w|
|ID10	|d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Tethybacterales; f__Persebacteraceae;g__Persebacter;s__	|Poridera sp.           |ND  |10.1038/s41598-024-56480-w|
|M55B157_sp018609125|	d__Bacteria;p__Actinomycetota; c__Actinomycetes;o__S36-B12; f__S36-B12;g__M55B157;s__M55B157 sp018609125|Halisarca dujardinii |ND  |Koltzov Institute of Developmental Biology, Russian Academy of Sciences|
|Eutrophobiaceae    |	d__Bacteria;p__Pseudomonadota; c__Gammaproteobacteria;o__Eutrophobiales; f__Eutrophobiaceae;g__;s__	    |Halisarca dujardinii	|ND  |Koltzov Institute of Developmental Biology, Russian Academy of Sciences|
|Casp-alpha2        |	d__Bacteria;p__Pseudomonadota; c__Alphaproteobacteria;o__Rhodospirillales; f__Casp-alpha2;g__;s__	      |Halisarca dujardinii	|ND  |Koltzov Institute of Developmental Biology, Russian Academy of Sciences|

# 4. Assign HMA/LMA type to each sponge based on literature sources (Timing variable)

– If at least three studies on species within a genus, or three independent examples, consistently indicated a specific type, that type was assigned to the entire genus. 

– Coelocarteria singaporensis was classified as HMA (High Microbial Abundance), as it was identified as HMA (High Microbial Abundance)in two studies (10.1128/mBio.01577-21, 10.1016/j.scitotenv.2024.170171) and as LMA (Low Microbial Abundance) in one study (10.1007/s00338-024-02568-8).

– A total of 1,646 genomes were associated with sponges, including 1,626 from the GTDB and 20 manually added from published articles (derived from 142 sponge samples: 137 from GTDB and 5 newly added). Of these genomes, 91 were labeled only as Porifera sp., while the remainder were identified to more specific taxonomic levels.

Among the 1,646 genomes:

	•	1,086 genomes (1,085 from GTDB + 1 newly added), originating from 42 sponge species, were classified as HMA (High Microbial Abundance);
 
	•	308 genomes (297 from GTDB + 11 newly added), from 50 sponge species (45 GTDB + 5 newly added), were classified as LMA (Low Microbial Abundance);
 
	•	252 genomes (244 from GTDB + 8 newly added), from 51 sponge species (50 GTDB + 1 newly added), were classified as ND (Not Determined).

The 6 newly added sponge species were Isodictya palmata, Halichondria sitiens, Tethya stolonifera, Scopalina sp., Tsitsikamma favus, and Halisarca dujardinii.

|Sponge Name                  |Genomes count|Type| Reference (doi)                                |
|-----------------------------|-------------|----|------------------------------------------------|
|Agelas oroides               |50	          |HMA |10.1093/femsec/fiv115                           |
|Agelas tubulata              |1            |HMA |10.1128/mBio.01577-21                           |
|Aplysina aerophoba           |67	          |HMA |10.1086/BBLv227n1p78                            |
|Aplysina fistularis          |4            |HMA |10.1086/BBLv227n1p78                            |
|Aplysina fulva	              |1	          |HMA |10.1007/s00442-007-0910-0                       |
|Chondrilla nucula	          |2	          |HMA |10.1093/femsec/fiv115                           |
|Chondrosia reniformis        |2	          |HMA |10.1093/femsec/fiv115                           |
|Coelocarteria singaporensis  |12	          |HMA |10.1128/mBio.01577-21                           |
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
|Crambe crambe                |2	          |LMA |10.1128/mBio.01577-21                           |
|Crella incrustans	          |1	          |LMA |10.1128/mBio.01577-21                           |
|Cymbastela concentrica	      |1	          |LMA |10.1093/femsec/fiv115                           |
|Dysidea tupha                |1	          |LMA |Based on species from the same genus.                |
|Halichondria bowerbanki      |1	          |LMA |Based on species from the same genus.                |
|Halichondria okadai          |1	          |LMA |Based on species from the same genus.                |
|Halichondria panicea         |21	          |LMA |10.1093/femsec/fiv115                           |
|Halichondria sitiens	        |4	          |LMA |10.3390/jmse10091312                            |
|Halichondria sp.             |1	          |LMA |Based on no fewer than three species from this genus.|
|Haliclona cymaeformis        |1	          |LMA |10.1007/s00338-024-02568-8                      |
|Haliclona oculata            |25         	|LMA |Based on species from the same genus.                |
|Haliclona sp.                |3	          |LMA |Based on no fewer than three species from this genus.|
|Haliclona xena               |3	          |LMA |10.1111/1574-6941.12400                         |
|Halisarca caerulea           |1	          |LMA |10.1002/lno.11384                               |
|Hymeniacidon sinapium        |3          	|LMA |10.1093/femsec/fiv115                           |
|Hymeniacidon sp.             |3          	|LMA |Based on no fewer than three species from this genus.|
|Ianthella basta              |8	          |LMA |10.3389/fmicb.2017.00752                        |
|Isodictya palmata            |1            |LMA |10.1101/2025.03.15.643485                       |
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
|Scopalina sp.                |1	          |LMA |10.1128/mBio.01577-21                           |
|Stylissa flabelliformis      |11         	|LMA |10.1016/j.scitotenv.2024.17017                  |
|Tedania ignis                |1	          |LMA |10.1086/BBLv227n1p78                            |
|Tethya californiana          |2         	  |LMA |Based on species from the same genus.                |
|Tethya stolonifera	          |1            |LMA |10.1093/femsec/fiv115                           |
|Tethya sp.                   |1         	  |LMA |10.1080/14772000.2024.2383341                   |
|Tsitsikamma favus            |1	          |LMA |10.1128/mBio.01577-21                           |
|Vazella pourtalesii          |67	          |LMA |10.1038/s41598-020-74670-0                      |
|Aiolochroia sp.              |12	          |ND  |                                                     |
|Anoxycalyx joubini	          |1	          |ND  |                                                     |
|Antho dichotoma	            |3	          |ND  |                                                     |
|Arenosclera brasiliensis	    |2	          |ND  |                                                     |
|Cacospongia mycofijiensis    |1	          |ND  |                                                     |
|Chalinula sp.	              |1	          |ND  |                                                     |
|Cinachyrella australiensis   |2          	|ND  |                                                     |
|Cinachyrella kuekenthali	    |1          	|ND  |                                                     |
|Cinachyrella sp.	            |2	          |ND  |                                                     |
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
|Halisarca dujardinii         |3            |ND  |                                                     |
|Haplosclerida sp.	          |5	          |ND  |                                                     |
|Hexactinellida sp.	          |2	          |ND  |                                                     |
|Hyattella lendenfeldi	      |1	          |ND  |                                                     |
|Hymedesmia methanophila	    |1	          |ND  |                                                     |
|Iophon methanophila	        |2	          |ND  |                                                     |
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
|Porifera sp.	                |91	          |ND  |                                                     |
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

The input file, table.tsv, is generated in the first step (1). The resulting output is filtered in the second step (2), expanded with newly added genomes in the third step (3), and annotated with type information (HMA/LMA) in this step. The final output is saved as [![table2.tsv.gz](https://img.shields.io/badge/table2.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/table2.tsv.gz), with the following columns:
	1.	GTDB accession
	2.	GTDB taxonomy
	3.	Sponge species (derived from column 4)
	4.	Data from biosample_set.xml
	5.	Type (HMA/LMA)

A total of 1,646 genomes were associated with sponges, while 135,020 genomes had no sponge-related information in the XML metadata from NCBI.

# 5. Figure 1 (Timing < 1 min)

Distributions of bacterial family size (number of representative genomes) and a sponge score (proportion of representative genomes isolated from sponge metagenomes) for bacterial families encountered at least one representative genome isolated from a sponge metagenome.

>Run script ./create_figure_1.sh 

The input file is a file named [![table2.tsv.gz](https://img.shields.io/badge/table2.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/table2.tsv.gz)

The output file, [![input_file_for_figure_1.tsv](https://img.shields.io/badge/input_file_for_figure_1.tsv-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/input_file_for_figure_1.tsv), contains 286 unique entries. The columns are structured as follows:

1st column, GTDB Taxonomy – Family-level taxonomic classification based on genomes isolated from sponge metagenomes.

2nd column, Sponge-Associated Genomes – Number of representative genomes derived from sponge metagenomes.

3rd column, Total Representative Genomes – Total number of representative genomes in the dataset.

4th column, Logarithm of Representative Genomes – Base-10 logarithm of the total representative genomes

5th column, Sponge Score – Proportion of representative genomes isolated from sponge metagenomes, calculated as ratio Sponge-Associated Genomes to Total Representative Genomes

6th column, Family Classification – Categorization of each family into one of three types based on **Sponge Score**:

**Exclusively sponge-associated** (Sponge Score ≥ 0.75) – 74 families, 453 genomes.

**Mixed** (0.25 < Sponge Score < 0.75) – 53 families, 487 genomes.

**Occasionally sponge-associated** (Sponge Score ≤ 0.25) – 159 families, 706 genomes.

>Run script figure_1.R 

The input file is a file named [![input_file_for_figure_1.tsv](https://img.shields.io/badge/input_file_for_figure_1.tsv-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/input_file_for_figure_1.tsv)

The output file, [![figure_1.svg](https://img.shields.io/badge/figure_1.svg-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/figure_1.svg)

# 6. The experimental group versus the control group (Timing 8 mins)

– The experimental group will consist of genomes previously classified as **Exclusively sponge-associated** and **Mixed** (127 families, 940 genomes). The control will include two groups: SFNS – non-sponge-associated bacteria from families associated with sponges, and NFNS – non-sponge-associated bacteria from families not associated with sponges (closest neighbors in the phylogenetic tree, which may include genomes previously marked as occasionally sponge-associated).

>Run script ./find_experemental_control.groups.sh

The input files are [![input_file_for_figure_1.tsv](https://img.shields.io/badge/input_file_for_figure_1.tsv-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/input_file_for_figure_1.tsv)
and [![table2.tsv.gz](https://img.shields.io/badge/table2.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/table2.tsv.gz) and [![bac120_r226.tree](https://img.shields.io/badge/bac120_r226.tree-brightgreen)](https://data.ace.uq.edu.au/public/gtdb/data/releases/release226/226.0/bac120_r226.tree) from GTDB database

The output files are:

[![940.tsv.gz](https://img.shields.io/badge/940.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/940.tsv.gz) - experemental group, 940 genomes, 127 families

[![656.tsv.gz](https://img.shields.io/badge/656.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/656.tsv.gz) - control group (see description below), SFNS, 656 genomes, 72 families (from 127 families)

[![844.tsv.gz](https://img.shields.io/badge/844.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/844.tsv.gz) - control group (see description below), NFNS, 844 genomes, 90 families

[![926.tsv.gz](https://img.shields.io/badge/926.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/926.tsv.gz) [![135070.tsv.gz](https://img.shields.io/badge/135070.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/135070.tsv.gz) [![90.tsv.gz](https://img.shields.io/badge/90.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/90.tsv.gz) [![134980.tsv.gz](https://img.shields.io/badge/134980.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/134980.tsv.gz) [![754.tsv.gz](https://img.shields.io/badge/754.tsv.gz-brightgreen)](https://github.com/RiMaxim/sulfoacetate/blob/main/754.tsv.gz) - Intermediate files (see description below)

– From the initial list of 136,666 genomes, we subtract **940** genomes. From the resulting list of 135,726 genomes, we extract **656** genomes that belong to the same families as the 940 genomes. These **656** genomes also do not belong to sponges. This leaves us with **135,070** genomes.

– In the experimental group, 14 genomes were added from other sources and are not part of the GTDB database (926 = 940 - 14). For the **926** genomes, we identified their closest neighbors (**90** genomes from 90 families) based on the phylogenetic tree constructed from the **135,070** genomes.

– Next, we subtract these **90** genomes from the list of **135,070**, which results in **134,980** genomes. From these, we extract **754** genomes that belong to the same families as the 90 genomes. We combined the **754** genomes with the **90** genomes, resulting in a total of **844** genomes.


|Genomes count|Families count|Classification|
|-------------|--------------|--------------------------|
|940          |127     |Sponge: Exclusively sponge-associated (453: HMA(342); LMA (75); ND (36)) and Mixed (487: : HMA(399); LMA (34); ND (54))) Occasionally sponge-associated (0)\nNot sponge: 0|
|656          |72      |Sponge: Exclusively sponge-associated (0) and Mixed (0) Occasionally sponge-associated (0)    |
|844          |90      |Sponge: Exclusively sponge-associated (0) and Mixed (0) Occasionally sponge-associated (13: HMA(8); LMA (4); ND (1))   |
