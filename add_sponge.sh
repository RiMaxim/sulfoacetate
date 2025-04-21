#!/bin/bash

# Check if all arguments are provided
if [ $# -lt 3 ]; then
    echo "Usage: $0 <sponge_names_file> <input_file> <output_file>"
    exit 1
fi

sponge_names_file="$1"
input_file="$2"
output_file="$3"

# Clear the output file
> "$output_file"

# Process each line of the input file
while read -r line; do
    # Initialize variables
    found=""
    
    # Check against each sponge name individually
    while read -r sponge_name; do
        # Skip empty lines in sponge names file
        [ -z "$sponge_name" ] && continue
        
        # Check for match (case insensitive)
        if echo "$line" | grep -q -i -w "$sponge_name"; then
            found="$sponge_name"
            break  # Stop after first match
        fi
    done < "$sponge_names_file"

    # Format the output
    if [ -z "$found" ]; then
        printf "ND\t%s\n" "$line" >> "$output_file"
    else
        # Capitalize first letter only
        capitalized_found=$(echo "$found" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')
        printf "%s\t%s\n" "$capitalized_found" "$line" >> "$output_file"
    fi
done < "$input_file"

echo "Results written to $output_file"
