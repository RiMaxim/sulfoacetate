import argparse
import csv
from Bio import SeqIO

def extract_gbk_data(input_gbk_file, output_csv_file):
    """Extracts data from a GBK file and writes it to a CSV file."""
    with open(output_csv_file, mode="w", newline="") as csv_file:
        csv_writer = csv.writer(csv_file, delimiter="\t")

        for record in SeqIO.parse(input_gbk_file, "genbank"):
            for feature in record.features:
                if feature.type == "CDS":  # Only coding sequences
                    gene = feature.qualifiers.get("gene", [""])[0]

                    csv_writer.writerow([gene])  # Write a row

def main():
    parser = argparse.ArgumentParser(description="Extract information from a GBK file and save it to a CSV.")
    parser.add_argument("input_gbk", help="Path to the input GBK file")
    parser.add_argument("output_csv", help="Path to the output CSV file")
    args = parser.parse_args()

    extract_gbk_data(args.input_gbk, args.output_csv)
    print(f"Data saved to {args.output_csv}")

if __name__ == "__main__":
    main()
