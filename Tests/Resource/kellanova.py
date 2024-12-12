import os
import shutil
from PIL import Image
from fpdf import FPDF
import os


def copy_images(source_dir, target_dir):

    # Ensure the target directory exists

    if not os.path.exists(target_dir):

        os.makedirs(target_dir)

    # Supported image formats by PIL (Pillow)

    image_formats = ('.jpeg', '.jpg', '.png', '.gif', '.bmp', '.tiff', '.webp')

    # Iterate over files in the source directory

    for file_name in os.listdir(source_dir):

        file_path = os.path.join(source_dir, file_name)

        # Check if it's a file and if it has a valid image format

        if os.path.isfile(file_path):

            try:

                with Image.open(file_path) as img:  # This will fail if the file is not a valid image

                    if file_name.lower().endswith(image_formats):

                        target_path = os.path.join(target_dir, file_name)

                        shutil.copy(file_path, target_path)

                        print(f"Copied: {file_name}")

            except Exception as e:

                print(f"Skipped: {file_name} - Not a valid image file or format not supported. Error: {e}")



def delete_specific_files_in_folder(folder_path):
    try:
        if os.path.exists(folder_path):
            for filename in os.listdir(folder_path):
                file_path = os.path.join(folder_path, filename)
                if os.path.isfile(file_path) and (filename.endswith('.png') or filename.endswith('.jpg')):
                    os.remove(file_path)  # Delete the file
                    print(f"Deleted {file_path}")
                else:
                    print(f"{file_path} is not a .png or .jpg file.")
        else:
            print(f"The folder '{folder_path}' does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")