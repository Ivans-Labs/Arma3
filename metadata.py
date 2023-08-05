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
    inside_fence = False
    while i < len(lines):
        if lines[i] == "```":
            inside_fence = not inside_fence
            i += 1
            continue
        if inside_fence:
            line = lines[i].strip()
            if ":" in line:
                key, value = [item.strip() for item in line.split(":", 1)]
                metadata[key] = value
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
                    metadata['File'] = file
                    result.append(metadata)
        except Exception as e:
            print(f"Error processing file: {file}")
            print(str(e))
    return result

def save_to_json(data, filename):
    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)

directory = os.getcwd()
output_file = "metadata.json"

metadata = process_markdown_files(directory)
save_to_json(metadata, output_file)