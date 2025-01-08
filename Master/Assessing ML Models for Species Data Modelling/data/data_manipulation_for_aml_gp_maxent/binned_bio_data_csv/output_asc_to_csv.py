import os
import pandas as pd
import numpy as np
import rasterio

# Define input and output directories
input_directory = '/Users/rorymilsom/Desktop/maxent_logistic/'  # Replace with your folder path
output_directory = '/Users/rorymilsom/Desktop/output_logistic_csv'  # Replace with the desired output folder path

# Create output directory if it doesn't exist
os.makedirs(output_directory, exist_ok=True)

# Iterate through each file in the input directory
for filename in os.listdir(input_directory):
    if filename.endswith('.asc'):  # Process only .asc files
        asc_file_path = os.path.join(input_directory, filename)
        csv_file_path = os.path.join(output_directory, f"{os.path.splitext(filename)[0]}.csv")

        # Read the .asc file using rasterio
        with rasterio.open(asc_file_path) as src:
            data = src.read(1)
            transform = src.transform

            # Generate longitude and latitude for each pixel
            rows, cols = np.indices(data.shape)
            longitudes, latitudes = rasterio.transform.xy(transform, rows, cols, offset='center')

            # Flatten the arrays and combine them into a DataFrame
            df = pd.DataFrame({
                'longitude': np.array(longitudes).flatten(),
                'latitude': np.array(latitudes).flatten(),
                'value': data.flatten()
            })

        # Save the DataFrame to a CSV file
        df.to_csv(csv_file_path, index=False)
        print(f"Converted {filename} to {csv_file_path}")

print("All .asc files have been converted to .csv files.")