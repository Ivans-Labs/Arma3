import os

directories = ['missions', 'tools']

with open('README.md', 'w') as f:

    for directory in directories:
        f.write(f"## {directory.capitalize()}\n")
        for folder in os.listdir(directory):
            if os.path.isdir(os.path.join(directory, folder)):
                f.write(f"### {folder}\n")
                about_file = os.path.join(directory, folder, 'about.md')
                if os.path.isfile(about_file):
                    with open(about_file, 'r') as about:
                        f.write(about.read())
                        f.write("\n")
        f.write("\n")