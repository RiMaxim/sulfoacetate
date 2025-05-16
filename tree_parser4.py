import sys

def clean_file(input_file, output_file):
    """
    Removes carriage return characters (^M or \r) from the input file
    and writes the cleaned content to the output file.
    """
    try:
        with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
            for line in infile:
                # Remove carriage return characters and write the cleaned line
                clean_line = line.replace('\r', '')
                outfile.write(clean_line)
        print(f"File successfully cleaned. Output saved to {output_file}")
    except FileNotFoundError:
        print(f"Error: File {input_file} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <output_file>")
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]
        clean_file(input_file, output_file)
