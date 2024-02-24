#!/usr/bin/env python3

import sys
import os
import subprocess

if len(sys.argv) < 3:
    print("""Error: Path to directory with WoW client or WoW type not specified.
Example: python3 docker.py wow_client_dir type.
Type could be 'classic', 'tbc' or 'wotlk'""")
    sys.exit(1)

wow_client_path = sys.argv[1]
wow_type = sys.argv[2].lower() 
wow_types = ["classic", "tbc", "wotlk"]

if wow_type not in wow_types:
    print(f"Error: Invalid WoW type. It should be one of: {', '.join(valid_wow_types)}")
    sys.exit(1)

if not os.path.isdir(wow_client_path):
    print(f"Error: Directory '{wow_client_path}' does not exist.")
    sys.exit(1)

print(f"WoW client: {wow_client_path}")

extracted_data_dir = "extracted-data"
os.makedirs(extracted_data_dir, exist_ok=True)

if os.listdir(extracted_data_dir):
    print(f"Error: Directory '{extracted_data_dir}' is not empty.")
    #sys.exit(1)

realmd_image = f"ghcr.io/jrtashjian/cmangos-realmd-{wow_type}:latest"
mangosd_image = f"ghcr.io/jrtashjian/cmangos-mangosd-{wow_type}:latest"
extractor_image = f"ghcr.io/jrtashjian/cmangos-extractors-classic:latest"
print(f"realmd build image: {realmd_image}")
print(f"mangosd build image: {mangosd_image}")
print(f"extractor image: {extractor_image}")

print(f"Trying to pull: {extractor_image}")
#subprocess.run(f"docker run -v {wow_client_path}:/client -v ./{extracted_data_dir}:/maps {extractor_image}", shell=True)

#dockerfile_mangosd = f"""FROM {mangosd_image}
#COPY extracted-data /opt/cmangos-data
#"""

#with open("Dockerfile", "w") as dockerfile:
#    dockerfile.write(dockerfile_mangosd)

print("Dockerfile created successfully.")
mangosd_tag = f"k8s-mangosd-{wow_type}"
subprocess.run(f"docker build -t {mangosd_tag} .", shell=True)
