import xml.etree.ElementTree as ET

def parse_biosample_blocks(file_path, output_file, log_file):
    keywords = {"sponge", "Sponge", "porifera", "Porifera"}

    try:
        with open(output_file, 'w', encoding='utf-8') as output, open(log_file, 'w', encoding='utf-8') as log:
            block_count = 0
            matched_count = 0

            for event, elem in ET.iterparse(file_path, events=("end",)):
                if elem.tag == "BioSample":
                    id_elem = elem.find(".//Id[@db='BioSample']")
                    id_value = id_elem.text.strip() if id_elem is not None else "N/A"

                    # Collect all attribute texts
                    attributes = elem.findall(".//Attribute")
                    attr_texts = [attr.text.strip() for attr in attributes if attr.text]

                    # Also check Description if present
                    description_elem = elem.find(".//Description")
                    if description_elem is not None and description_elem.text:
                        attr_texts.append(description_elem.text.strip())

                    # Search for keywords in attributes/descriptions
                    if any(any(kw in text for kw in keywords) for text in attr_texts):
                        matched_count += 1
                        output.write(id_value + '\t' + '||'.join(attr_texts) + '\n')

                    # Log processed ID
                    log.write(f"Processed BioSample ID: {id_value}\n")
                    block_count += 1
                    elem.clear()

            log.write(f"Total BioSample blocks: {block_count}\n")
            log.write(f"Matched BioSample blocks: {matched_count}\n")
            print(f"Total processed: {block_count}, matched: {matched_count}. Results saved to {output_file}")

    except ET.ParseError:
        print("Ошибка парсинга XML. Проверьте формат файла.")
    except FileNotFoundError:
        print(f"Файл {file_path} не найден.")
    except IOError as e:
        print(f"Ошибка ввода-вывода: {e}")

# Пример вызова
xml_file_path = "biosample_set.xml"
output_file = "biosample_sponge_matches.tsv"
log_file = "biosample_log.tsv"

parse_biosample_blocks(xml_file_path, output_file, log_file)
