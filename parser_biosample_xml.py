import xml.etree.ElementTree as ET
from pathlib import Path
import sys

def parse_biosample_blocks(file_path, output_file, log_file):
    """Parse BioSample XML to find sponge-related entries.
    
    Args:
        file_path (str): Path to input XML file
        output_file (str): Path to output TSV file with matches
        log_file (str): Path to log file with processing info
    """
    
    # Keywords to search for (case-sensitive)
    keywords = {"sponge", "Sponge", "porifera", "Porifera"}
    
    # Convert to Path objects for better path handling
    xml_path = Path(file_path)
    output_path = Path(output_file)
    log_path = Path(log_file)
    
    try:
        # Verify input file exists and is not empty
        if not xml_path.exists():
            raise FileNotFoundError(f"Input file {xml_path} not found")
        if xml_path.stat().st_size == 0:
            raise ValueError(f"Input file {xml_path} is empty")
            
        with (output_path.open('w', encoding='utf-8') as output,
              log_path.open('w', encoding='utf-8') as log):
            
            # Write output header
            output.write("BioSampleID\tMatchingContent\n")
            log.write("BioSample Processing Log\n=======================\n")
            
            # Initialize counters
            block_count = 0
            matched_count = 0
            
            # Parse XML incrementally with error context
            context = ET.iterparse(file_path, events=("start", "end"))
            
            for event, elem in context:
                if event == "end" and elem.tag == "BioSample":
                    try:
                        block_count += 1
                        
                        # Find primary BioSample ID
                        id_elem = elem.find(".//Id[@db='BioSample'][@is_primary='1']")
                        biosample_id = id_elem.text.strip() if id_elem is not None else "N/A"
                        
                        # Log current processing
                        if block_count % 1000 == 0:
                            print(f"Processed {block_count} records...", file=sys.stderr)
                            log.write(f"Processed {block_count} records...\n")
                        
                        # Get all text content from the entire BioSample block
                        all_text = ET.tostring(elem, encoding='unicode', method='text')
                        all_text = ' '.join(all_text.split())  # Normalize whitespace
                        
                        # Check for keywords in the entire block
                        if any(keyword in all_text for keyword in keywords):
                            matched_count += 1
                            # Write matching entry to output (truncate to 1000 chars)
                            output.write(f"{biosample_id}\t{all_text[:1000]}\n")
                        
                        # Clear element to save memory
                        elem.clear()
                        
                    except Exception as e:
                        print(f"Error processing BioSample block: {e}", file=sys.stderr)
                        log.write(f"Error processing block {block_count}: {e}\n")
                        continue
            
            # Write summary statistics
            summary = (f"\nProcessing complete:\n"
                      f"Total BioSample blocks processed: {block_count}\n"
                      f"Matching BioSample blocks found: {matched_count}\n"
                      f"Match percentage: {matched_count/block_count*100:.2f}%\n")
            
            log.write(summary)
            print(summary)

    except ET.ParseError as e:
        error_msg = f"XML parsing error at position {e.position}: {e}"
        print(error_msg, file=sys.stderr)
        log.write(error_msg)
    except Exception as e:
        error_msg = f"Error occurred: {e}"
        print(error_msg, file=sys.stderr)
        log.write(error_msg)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python parser_biosample_xml.py <input.xml> <output.tsv> <log.txt>")
        sys.exit(1)
        
    xml_file_path = sys.argv[1]
    output_file = sys.argv[2]
    log_file = sys.argv[3]
    
    parse_biosample_blocks(xml_file_path, output_file, log_file)
