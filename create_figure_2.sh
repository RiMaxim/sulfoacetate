#!/bin/bash

awk -F'\t' '
{
    id = $1
    if (id ~ /OTU|ID/) {
        new_id = id
    } else {
        split(id, parts, "_")
        new_id = parts[2] "_" parts[3]
    }
    print id "\t" new_id
}' 656.tsv 844.tsv 940.tsv > tmp0

cut -f 2 tmp0 >tmp1

while read -r id; do
    python3 ./extract_cluster.py /home/lam2/sulfoacetate/genomes/prokka/${id}/${id}.gbk tmp2 # change path to gbk
    sed -i 's/\r//g' tmp2

awk '
{
    genes[NR] = $0
}
END {
    found = 0
    for (i = 1; i <= NR; i++) {
        if (genes[i] ~ /sauS/) {
            found = 1
            start = (i - 3 < 1) ? 1 : i - 3
            end = (i + 3 > NR) ? NR : i + 3
            output = ""
            for (j = start; j <= end; j++) {
                output = output (output == "" ? genes[j] : "|" genes[j])
            }
            print output > "tmp3"
        }
    }
    if (found == 0) {
        print "ND" > "tmp3"
    }
}
' tmp2
    awk -v filename="${id}" '{print filename"\t"$0}' tmp3 >tmp4
    cat tmp4 >>tmp5
done < tmp1

awk -F '\t' '{
    if (($2 ~ /sauS/ && $2 ~ /sauT/) || ($2 ~ /sauS/ && $2 ~ /sucC/ && $2 ~ /sucD/))
        print
}' tmp5 >tmp6

cat tmp0 |awk -F'\t' '{print $2"\t"$1}' >tmp7

./table_combiner.sh tmp7 tmp6 tmp8

cat tmp8 |awk -F'\t' '{print $3"\t"$2}' >tmp9

./table_combiner.sh tmp9 656.tsv tmp10
cat tmp10 |awk -F'\t' '{if($6 != "ND") print $0}' > 656_sulfoacetate.tsv
./table_combiner.sh tmp9 844.tsv tmp11
cat tmp11 |awk -F'\t' '{if($6 != "ND") print $0}' >844_sulfoacetate.tsv
./table_combiner.sh tmp9 940.tsv tmp12
cat tmp12 |awk -F'\t' '{if($6 != "ND") print $0}' >940_sulfoacetate.tsv

pigz 656_sulfoacetate.tsv 844_sulfoacetate.tsv 940_sulfoacetate.tsv

rm tmp*