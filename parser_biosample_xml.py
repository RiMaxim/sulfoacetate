import xml.etree.ElementTree as ET

def parse_biosample_blocks(file_path, output_file, log_file):
    try:
        # Open output and log files for writing in append mode
        with open(output_file, 'w') as output, open(log_file, 'w') as log:
            # Initialize block counter
            block_count = 0

            # Iterate through the XML file and process each <BioSample> element
            for event, elem in ET.iterparse(file_path, events=("end",)):
                if elem.tag == "BioSample":
                    # Find the <Id db="BioSample"> element
                    id_elem = elem.find(".//Id[@db='BioSample']")
                    id_value = id_elem.text if id_elem is not None else "N/A"
                    
                    # Find the <Attribute attribute_name="host"> element
                    host_elem = elem.find(".//Attribute[@attribute_name='host']")
                    host_value = host_elem.text if host_elem is not None else "ND"

                    # Find the <Attribute attribute_name="lat_lot"> element
                    lat_lot_elem = elem.find(".//Attribute[@attribute_name='lat_lon']")
                    lat_lot_value = lat_lot_elem.text if lat_lot_elem is not None else "ND"
                    
                    # Write result to the output file
                    output.write(f"{id_value}\t{host_value}\t{lat_lot_value}\n")
                    
                    # Write the ID of the processed block to the log file
                    log.write(f"Processed BioSample ID: {id_value}\n")
                    
                    # Increment the block counter
                    block_count += 1

                    # Clear the element to save memory
                    elem.clear()
            
            # After processing all blocks, log the total number of processed blocks
            log.write(f"Total processed BioSample blocks: {block_count}\n")
            print(f"Processed {block_count} BioSample blocks. Output written to {output_file} and log written to {log_file}.")

    except ET.ParseError:
        print("Error parsing XML file. Please check the file format.")
    except FileNotFoundError:
        print(f"The file {file_path} was not found.")
    except IOError as e:
        print(f"An I/O error occurred: {e}")


# Example usage
xml_file_path = "biosample_set.xml"  # Replace with your XML file path
output_file = "biosample_host_lat_lot.tsv"  # Replace with desired output file path
log_file = "biosample_log.tsv"  # Replace with desired log file path

parse_biosample_blocks(xml_file_path, output_file, log_file)
