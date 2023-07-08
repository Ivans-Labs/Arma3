import os
import shutil
import importlib
import argparse

def prompt_for_mission():
    mission = input("Enter the name of the mission: ")
    while not mission:
        print("The name of the mission can't be empty.")
        mission = input("Enter the name of the mission: ")
    return mission

def prompt_for_file():
    file = input("Enter the path to the file: ")
    while not os.path.isfile(file):
        print("The file does not exist. Please try again.")
        file = input("Enter the path to the file: ")
    return file

def create_directory_if_not_exists(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def copy_file_to_directory(file, directory):
    shutil.copy2(file, directory)

def generate_sqf_script(mission, file):
    file_name, file_extension = os.path.splitext(os.path.basename(file))
    script_path = os.path.join(mission, f"{file_name}.sqf")

    try:
        # Try to import the module according to the file extension
        preset_module = importlib.import_module(f'presets.{file_extension[1:]}')

        # Generate the script using the module
        script = preset_module.generate_script(mission, os.path.basename(file))

        # Write the script to the file
        with open(script_path, 'w') as f:
            f.write(script)

        print(f"Script file is created at: {script_path}")
    except ImportError:
        print(f"No preset module found for {file_extension} files.")
    except Exception as e:
        print(f"An error occured while generating the script: {str(e)}")

def main():
    parser = argparse.ArgumentParser(description='Arma 3 SQF Script Generator')
    parser.add_argument('-m', '--mission', type=str, help='Mission name')
    parser.add_argument('-f', '--file', type=str, help='Path to the file')

    args = parser.parse_args()

    mission = args.mission if args.mission else prompt_for_mission()
    file = args.file if args.file else prompt_for_file()

    mission_folder = os.path.join(os.path.dirname(__file__), mission)
    create_directory_if_not_exists(mission_folder)
    copy_file_to_directory(file, mission_folder)
    generate_sqf_script(mission, file)

if __name__ == "__main__":
    main()