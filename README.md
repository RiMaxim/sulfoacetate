Timing: <10 mins

download.sh – Download and decompress gzip files from GTDB (bac120_metadata_r226.tsv.gz, 2025-04-08 13:37, 225 MB; bac120_r226.tree.gz, 2025-04-08 13:38, 1.6 MB) and NCBI (biosample_set.xml.gz, 2025-04-19 10:07, 3.2 GB).  


Timing: 52 mins

parser_biosample_xml.py – a parser for biosample_set.xml from NCBI that outputs two files: biosample_host_lat_lot.tsv (with BioSample ID, host, and latitude/longitude columns) and biosample_log.tsv (recording processed block BioSample IDs).
