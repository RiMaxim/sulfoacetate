#!/bin/bash

# Check if required arguments are provided
if [ $# -lt 3 ]; then
    echo "Usage: $0 <sponge_names_file> <input_file> <output_file>"
    exit 1
fi

sponge_names_file="$1"  # File containing sponge taxonomic names
input_file="$2"        # Input file to search through
output_file="$3"       # Output file for results

# Clear or create the output file
> "$output_file"

# Process the input file using AWK
awk -v names_file="$sponge_names_file" '
BEGIN {
    # Load all sponge names from the file, sorting from most to least specific
    while ((getline < names_file) > 0) {
        name = $0
        # Determine specificity level (species > genus)
        # Species have space in name (e.g., "Homo sapiens")
        specificity = (name ~ / /) ? 2 : 1  
        names[++count] = name
        specificities[count] = specificity
    }
    close(names_file)
}

{
    matched = "Porifera sp"  # Default value when no match is found
    best_specificity = 0  # Track the most specific match found
    line_lower = tolower($0)  # Case-insensitive comparison

    # Check all names against each line
    for (i = 1; i <= count; i++) {
        name = names[i]
        name_lower = tolower(name)

        # Check for exact whole-word matches
        if (line_lower ~ "\\<" name_lower "\\>") {
            # If this is more specific than previous matches
            if (specificities[i] > best_specificity) {
                matched = name
                best_specificity = specificities[i]
                # Early exit if we find a species-level match
                if (best_specificity == 2) break
            }
        }

        # Additional check for "Genus sp" patterns
        if (match(name, /^[A-Z][a-z]+/)) {
            genus = substr(name, 1, RLENGTH)
            genus_sp = genus " sp"
            if (line_lower ~ "\\<" tolower(genus_sp) "\\>") {
                if (1 > best_specificity) {  # "Genus sp" has specificity 1
                    matched = genus_sp
                    best_specificity = 1
                }
            }
        }
    }

    # Output the best match found (or ND) followed by the original line
    print matched "\t" $0
}
' "$input_file" > "$output_file"
