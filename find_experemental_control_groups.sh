#input_file_for_figure1.tsv, table2.tsv - input files

#################################################

cat table2.tsv |awk -F'\t' '{if($3 != "Not sponge") print $1}' >tmp1
cat table2.tsv |awk -F'\t' '{if($3 != "Not sponge") print $2}'|awk -F';g__' '{print $1}' >tmp2
paste tmp2 tmp1 >tmp3
./table_combiner.sh input_file_for_figure1.tsv tmp3 tmp4
cat tmp4 |awk -F'\t' '{print $1"\t"$2"\t"$7}' >tmp5

cat table2.tsv |awk -F'\t' '{if($3 == "Not sponge") print $1}' >tmp6
cat table2.tsv |awk -F'\t' '{if($3 == "Not sponge") print $2}' |awk -F';g__' '{print $1}' >tmp7
paste tmp7 tmp6 |awk -F'\t' '{print $1"\t"$2"\t""ND"}' >tmp8

cat tmp5 tmp8 >tmp9

##################################################

declare -A col1_in_tmp10

> tmp10
while IFS=$'\t' read -r col1 col2 col3; do
    if [[ "$col3" == "exclusively sponge-associated" || "$col3" == "mixed" ]]; then
        echo -e "$col2\t$col1\t$col3" >> tmp10
        col1_in_tmp10["$col1"]=1
    fi
done < tmp9

> tmp11
> tmp12
while IFS=$'\t' read -r col1 col2 col3; do
    if [[ "$col3" == "exclusively sponge-associated" || "$col3" == "mixed" ]]; then
        continue  # Already handled in tmp10
    elif [[ "$col3" == "occasionally sponge-associated" || "$col3" == "ND" ]]; then
        if [[ ${col1_in_tmp10["$col1"]+_} ]]; then
            echo -e "$col2\t$col1\t$col3" >> tmp11
        else
            echo -e "$col2\t$col1\t$col3" >> tmp12
        fi
    else
        echo -e "$col2\t$col1\t$col3" >> tmp12
    fi
done < tmp9


cat tmp10 |awk -F'\t' '{print $1"\t"$3}' >tmp13
./table_combiner.sh table2.tsv tmp13 tmp14
cat tmp14 |awk -F'\t' '{print $1"\t"$3"\t"$4"\t"$6"\t"$2}' >940.tsv

cat tmp11 |awk -F'\t' '{print $1"\t"$3}' >tmp15
./table_combiner.sh table2.tsv tmp15 tmp16
cat tmp16 |awk -F'\t' '{print $1"\t"$3"\t"$4"\t"$6"\t"$2}' >656.tsv

cat tmp12 |awk -F'\t' '{print $1"\t"$3}' >tmp17
./table_combiner.sh table2.tsv tmp17 tmp18
cat tmp18 |awk -F'\t' '{print $1"\t"$3"\t"$4"\t"$6"\t"$2}' >135070.tsv

rm tmp*

##########################################################

#940.tsv, bac120_r226.tree - input files

cat 940.tsv |awk -F'\t' '{print $1}' |grep "_" >926.tsv
cat 135070.tsv |awk -F'\t' '{print $1"\t"$2}' >tmp1
python3 ./tree_parser.py


# Clear the final output file
> tmp9

# Maximum number of parallel jobs
MAX_JOBS=40
job_count=0

while read -r id; do
    (
        # Generate unique suffix to avoid filename collisions
        suffix=$(mktemp -u XXXXXX)

        # Step 1: Parse the tree for the given ID
        python3 ./tree_parser2.py pairs_with_distances_indexed.txt "${id}" >tmp2_${suffix}

        # Step 2: Extract parsed path data
        python3 ./tree_parser3.py tmp2_${suffix} tmp3_${suffix}

        # Step 3: Clean up the file (remove carriage returns)
        python3 ./tree_parser4.py tmp3_${suffix} tmp4_${suffix}

        # Step 4: Extract the second column
        cut -f 2 tmp4_${suffix} >tmp5_${suffix}

        # Step 5: Combine with the original table
        ./table_combiner.sh tmp1 tmp5_${suffix} tmp6_${suffix}

        # Step 6: Sort combined files
        sort -nrk 1 tmp6_${suffix} >tmp7_${suffix}
        sort -nrk 2 tmp4_${suffix} >tmp8_${suffix}

        # Step 7: Combine and filter rows, get the best hit
        paste tmp8_${suffix} tmp7_${suffix} | \
            awk -F'\t' '{if($5 != "ND") print $0}' | \
            sort -nk 3 | head -n 1 | \
            awk -F'\t' '{print $2}' >>tmp9

        # Optional: remove temporary files after processing (can be commented out for debugging)
        rm tmp{2,3,4,5,6,7,8}_${suffix}
    ) &

    ((job_count++))
    if ((job_count >= MAX_JOBS)); then
        wait
        job_count=0
    fi
done < 926.tsv

# Wait for all background jobs to finish
wait

sort tmp9|uniq >tmp10
./table_combiner.sh 135070.tsv tmp10 90.tsv

cat 90.tsv |awk -F'\t' '{print $1"\t""1"}' >tmp11
./table_combiner.sh tmp11 135070.tsv tmp12
cat tmp12|awk -F'\t' '{if($6 != "1") print $1"\t"$2"\t"$3"\t"$4"\t"$5}' >134980.tsv

cat 90.tsv |awk -F'\t' '{print $2}' |awk -F';g__' '{print $1"\t""1"}' >tmp13
cat 134980.tsv |awk -F'\t' '{print $2}' |awk -F';g__' '{print $1}' >tmp14
paste tmp14 134980.tsv >tmp15
./table_combiner.sh tmp13 tmp15 tmp16
cat tmp16|awk -F'\t' '{if($7 == "1") print $2"\t"$3"\t"$4"\t"$5"\t"$6}' >754.tsv

rm tmp* pairs_with_distances_indexed.txt

pigz 134980.tsv 135070.tsv 656.tsv 754.tsv 90.tsv 926.tsv 940.tsv
