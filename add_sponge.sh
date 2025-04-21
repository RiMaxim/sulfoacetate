#!/bin/bash

# Check if all arguments are provided
if [ $# -lt 3 ]; then
    echo "Usage: $0 <sponge_names_file> <input_file> <output_file>"
    exit 1
fi

sponge_names_file="$1"  # File containing sponge names (one per line)
input_file="$2"         # File to process line by line
output_file="$3"        # File to write results

# Clear the output file if it exists
> "$output_file"

# Generate regex pattern from sponge names (e.g., "Demosponge|Hexactinellid|...")
sponge_pattern=$(tr '\n' '|' < "$sponge_names_file" | sed 's/|$//')

# Process each line of the input file
while read -r line; do
    # Extract the first matching sponge name (case-insensitive)
    found=$(echo "$line" | grep -o -E -i "$sponge_pattern" | head -n 1)

    # If no match, write "ND"; otherwise, capitalize the first letter only
    if [ -z "$found" ]; then
        printf "ND\t%s\n" "$line" >> "$output_file"
    else
        # Capitalize first letter, lowercase the rest (e.g., "hexactinellid" → "Hexactinellid")
        capitalized_found=$(echo "$found" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
        printf "%s\t%s\n" "$capitalized_found" "$line" >> "$output_file"
    fi
done < "$input_file"

echo "Results written to $output_file"
