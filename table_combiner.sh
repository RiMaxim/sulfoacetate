#!/bin/bash
# Robust TSV file merger that preserves all input data
# Merges two tab-separated files based on first column as key
# Adds reference columns while maintaining all original input data

set -euo pipefail  # Enable strict error handling

# Validate command line arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <reference_file> <input_file> <output_file>"
    echo "  reference_file: TSV with key in 1st column and values in other columns"
    echo "  input_file: TSV file to enrich with reference data"
    echo "  output_file: Merged output file with all original data plus reference columns"
    exit 1
fi

reference_file="$1"  # File containing reference data (key in column 1)
input_file="$2"      # Main input file to be enriched
output_file="$3"     # Destination for merged output

# Verify input files exist
for file in "$reference_file" "$input_file"; do
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' not found!" >&2
        exit 1
    fi
done

# Create temporary sorted files
tmp_ref=$(mktemp)      # Temporary file for sorted reference data
tmp_input=$(mktemp)    # Temporary file for sorted input data
trap 'rm -f "$tmp_ref" "$tmp_input"' EXIT  # Cleanup on exit

# Sort both files by first column for consistent merging
sort -k1,1 -t $'\t' "$reference_file" > "$tmp_ref"
sort -k1,1 -t $'\t' "$input_file" > "$tmp_input"

# Get column counts from both files
ref_cols=$(awk -F'\t' 'NR==1{print NF; exit}' "$tmp_ref")
input_cols=$(awk -F'\t' 'NR==1{print NF; exit}' "$tmp_input")

# Main merging logic using AWK
awk -F'\t' -v ref="$tmp_ref" -v ref_cols="$ref_cols" -v input_cols="$input_cols" '
BEGIN {
    # Load reference data into memory
    while ((getline < ref) > 0) {
        key = $1  # First column is the key
        # Store remaining columns in a 2D array
        for (i=2; i<=NF; i++) {
            ref_data[key][i-1] = $i
        }
    }
    close(ref)
}
{
    # First print all columns from input file exactly as they are
    printf "%s", $1
    for (i=2; i<=input_cols; i++) {
        printf "\t%s", $i
    }
    
    # Then append reference data if key exists
    if ($1 in ref_data) {
        for (i=1; i<ref_cols; i++) {
            printf "\t%s", ref_data[$1][i]  # Print reference values
        }
    } else {
        # Or fill with ND if key not found in reference
        for (i=1; i<ref_cols; i++) {
            printf "\tND"
        }
    }
    printf "\n"  # Finish the line
}
' "$tmp_input" > "$output_file"

echo "Merge completed successfully!"
echo "Output saved to: $output_file"
echo "Added $((ref_cols - 1)) reference columns to original $input_cols input columns"
