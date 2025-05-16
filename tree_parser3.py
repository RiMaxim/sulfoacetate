import re
import csv
import sys

def parse_paths(input_file, output_file):
    """
    Parses data from the input file, extracts the start node, end ID, and path length,
    then saves the result to an output TSV file (tab-separated, no header).
    """
    paths_data = []

    with open(input_file, 'r', encoding='utf-8') as file:
        for line in file:
            # Remove ^M characters and line breaks, if present
            line = line.replace('\r', '').replace('\n', '')

            # Regex to extract start node, end ID, and length
            match = re.match(r"^Path: (.+?) -> .* -> ([^,]+), Length: ([\d.]+)", line)
            if match:
                start_node = match.group(1)
                end_id = match.group(2)
                length = float(match.group(3))
                paths_data.append([start_node, end_id, length])

    # Save data to a tab-separated file
    with open(output_file, 'w', newline='', encoding='utf-8') as tsvfile:
        writer = csv.writer(tsvfile, delimiter='\t')
        writer.writerows(paths_data)

    print(f"Data successfully saved to {output_file}")

if __name__ == "__main__":
    # Check arguments
    if len(sys.argv) != 3:
        print("Usage: python3 script.py <input_file> <output_file>")
        sys.exit(1)

    # Read input and output file paths from arguments
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    # Call the parsing function
    parse_paths(input_file, output_file)
