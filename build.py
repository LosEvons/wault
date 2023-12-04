import os
print("Building docker image...")
os.system("docker build --tag docker-wault .")
print("Image built successfully!")