import pandas as pd
import numpy as np

# Load your data into a DataFrame (replace with your actual file path)
file_path = 'binned_bio_data_csv/temperature_seasonality.csv'
data = pd.read_csv(file_path)

# Ensure the data is sorted properly by latitude (descending) and longitude
data = data.sort_values(by=['latitude', 'longitude'], ascending=[False, True])

# Extract unique longitudes and latitudes
longitudes = sorted(data['longitude'].unique())
latitudes = sorted(data['latitude'].unique(), reverse=True)

# Grid dimensions
ncols = len(longitudes)
nrows = len(latitudes)

# Initialize the grid with a NODATA value (-9999)
grid = np.full((nrows, ncols), -9999, dtype=float)

# Map the 'value' column into the grid
for _, row in data.iterrows():
    col_index = longitudes.index(row['longitude'])
    row_index = latitudes.index(row['latitude'])
    grid[row_index, col_index] = row['value']

# Define ASC file parameters
xllcorner = min(longitudes)
yllcorner = min(latitudes)
cellsize = longitudes[1] - longitudes[0]  # Assuming uniform spacing

# Write the ASC file
output_path = '/Users/rorymilsom/Desktop/enviromental_variables/temperature_seasonality.asc'
with open(output_path, 'w') as asc_file:
    asc_file.write(f"ncols         {ncols}\n")
    asc_file.write(f"nrows         {nrows}\n")
    asc_file.write(f"xllcorner     {xllcorner}\n")
    asc_file.write(f"yllcorner     {yllcorner}\n")
    asc_file.write(f"cellsize      {cellsize}\n")
    asc_file.write(f"NODATA_value  -9999\n")
    np.savetxt(asc_file, grid, fmt='%.2f')

print(f"ASC file saved to {output_path}")
