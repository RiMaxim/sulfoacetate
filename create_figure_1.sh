#table2.tsv.gz - initial file

gunzip table2.tsv.gz
cat table2.tsv |awk -F'\t' '{if($3 != "Not sponge") print $0}' >tmp1  #tmp1 - genomes assosiated with sponge, 1646
cat tmp1 |awk -F'\t' '{print $2}' |awk -F';g__' '{print $1}' |sort|uniq -c|awk -F' ' '{print $2"\t"$1}' >tmp2 #tmp2 - 286 unique families for 1646 genomes
cat table2.tsv |awk -F'\t' '{print $2}' |awk -F';g__' '{print $1}' |sort|uniq -c|awk -F' ' '{print $2"\t"$1}' >tmp3 #tmp3 - 5332 unique families for all representive genomes 136666
./table_combiner.sh tmp3 tmp2 tmp4
cat tmp4 |awk -F'\t' 'BEGIN {OFS="\t"} {log_value = log($3)/log(10); ratio = $2/$3; if (ratio >= 0.75) status = "exclusively sponge-associated"; else if (ratio > 0.25 && ratio < 0.75) status = "mixed"; else status = "occasionally sponge-associated"; print $0, log_value, ratio, status;}' >input_file_for_figure_1.tsv
rm tmp*
