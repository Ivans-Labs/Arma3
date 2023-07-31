import os
import json

def search_markdown_files(directory):
    markdown_files = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.md'):
                markdown_files.append(os.path.join(root, file))
    return markdown_files

def extract_metadata(content):
    metadata = {}
    lines = content.split('\n')
    i = 0
    while i < len(lines):
        if lines[i] == "```" and len(lines) > i+3 and lines[i+3] == "```":
            # Extract metadata from the code block
            metadata_lines = lines[i+1:i+3]
            for line in metadata_lines:
                metadata[line.split(":")[0].strip()] = line.split(":")[1].strip()
            break
        i += 1
    return metadata

def process_markdown_files(directory):
    markdown_files = search_markdown_files(directory)
    result = []
    for file in markdown_files:
        try:
            with open(file, 'r') as f:
                content = f.read()
                metadata = extract_metadata(content)
                if metadata:
                    metadata['File'] = file  # Include file path in metadata
                    result.append(metadata)
        except Exception as e:
            print(f"Error processing file: {file}")
            print(str(e))
    return result

def save_to_json(data, filename):
    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)

# Example usage
directory = os.getcwd()  # Use current directory
output_file = "metadata.json"

metadata = process_markdown_files(directory)
save_to_json(metadata, output_file)