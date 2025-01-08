import rasterio
import pandas as pd
import numpy as np

# Load the datasets
df = pd.read_csv('data_train.txt')
df2 = pd.read_csv('/Users/rorymilsom/downloads/data_train_extra.txt')
df_target = pd.read_csv('df_targets_by_region.txt')
df_modified = pd.read_csv('modified_data.txt', sep='\t')
print(df_target)
# Define column names
column_titles_species = ['id', 'longitude', 'latitude']
column_titles = ['longitude', 'latitude']

# Process the first dataset
df_binned_species_lat_long1 = df.iloc[:, :3]
df_binned_species_long_lat1 = df_binned_species_lat_long1.reindex(columns=column_titles_species)

# Process the second dataset
df_binned_species_lat_long2 = df2.iloc[:, :3]
df_binned_species_long_lat2 = df_binned_species_lat_long2.reindex(columns=column_titles_species)

#Process the final modified dataset

df_binned_modified_species = df_modified.iloc[:, :3]
df_binned_modified_reindexed = df_binned_modified_species.reindex(columns=column_titles_species)

df_binned_modified_reindexed.to_csv('occurrences_binned_deoutliered.csv', index=False)

# Concatenate the two DataFrames
df_combined = pd.concat([df_binned_species_long_lat1, df_binned_species_long_lat2], axis=0)

# Reset the index to ensure it is unique and sequential
df_combined.reset_index(drop=True, inplace=True)

# Print the combined DataFrame
print(df_combined)

#df_combined.to_csv('combined_data_train.csv', index=False)


print(df_modified)
print(df_binned_modified_reindexed)









#Just the long and lat values dataframe

df_binned_lat_long = df.iloc[:, 1:3]
df_binned_long_lat = df_binned_lat_long.reindex(columns=column_titles)







#BIO1
df_just_bio_1 = df.iloc[:, 4]
df_binned_bio1_long_lat = df_binned_long_lat
df_binned_bio1_long_lat['value'] = df_just_bio_1
#print(df_binned_bio1_long_lat)
#df_binned_bio1_long_lat.to_csv('annual_mean_temperature.csv', index=False)

#BIO2
df_just_bio_2 = df.iloc[:, 5]
df_binned_bio2_long_lat = df_binned_long_lat
df_binned_bio2_long_lat['value'] = df_just_bio_2
#print(df_binned_bio2_long_lat)
#df_binned_bio2_long_lat.to_csv('mean_diurnal_range.csv', index=False)

#BIO3
df_just_bio_3 = df.iloc[:, 6]
df_binned_bio3_long_lat = df_binned_long_lat
df_binned_bio3_long_lat['value'] = df_just_bio_3
#print(df_binned_bio3_long_lat)
#df_binned_bio3_long_lat.to_csv('isothemality.csv', index=False)


#BIO4
df_just_bio_4 = df.iloc[:, 7]
df_binned_bio4_long_lat = df_binned_long_lat
df_binned_bio4_long_lat['value'] = df_just_bio_4
#print(df_binned_bio4_long_lat)
#df_binned_bio4_long_lat.to_csv('temperature_seasonality.csv', index=False)


#BIO5
df_just_bio_5 = df.iloc[:, 8]
df_binned_bio5_long_lat = df_binned_long_lat
df_binned_bio5_long_lat['value'] = df_just_bio_5
#print(df_binned_bio5_long_lat)
#df_binned_bio5_long_lat.to_csv('max_temp_warmest_month.csv', index=False)

#BIO6
df_just_bio_6 = df.iloc[:, 9]
df_binned_bio6_long_lat = df_binned_long_lat
df_binned_bio6_long_lat['value'] = df_just_bio_6
#print(df_binned_bio6_long_lat)
#df_binned_bio6_long_lat.to_csv('min_temp_warmest_month.csv', index=False)

#BIO7
df_just_bio_7 = df.iloc[:, 10]
df_binned_bio7_long_lat = df_binned_long_lat
df_binned_bio7_long_lat['value'] = df_just_bio_7
#print(df_binned_bio7_long_lat)
#df_binned_bio7_long_lat.to_csv('temp_annual_range.csv', index=False)

#BIO8
df_just_bio_8 = df.iloc[:, 11]
df_binned_bio8_long_lat = df_binned_long_lat
df_binned_bio8_long_lat['value'] = df_just_bio_8
#print(df_binned_bio8_long_lat)
#df_binned_bio8_long_lat.to_csv('mean_temp_wettest_quarter.csv', index=False)


#BIO9
df_just_bio_9 = df.iloc[:, 12]
df_binned_bio9_long_lat = df_binned_long_lat
df_binned_bio9_long_lat['value'] = df_just_bio_9
#print(df_binned_bio9_long_lat)
#df_binned_bio9_long_lat.to_csv('mean_temp_driest_quarter.csv', index=False)

#BIO10
df_just_bio_10 = df.iloc[:, 13]
df_binned_bio10_long_lat = df_binned_long_lat
df_binned_bio10_long_lat['value'] = df_just_bio_10
#print(df_binned_bio10_long_lat)
#df_binned_bio10_long_lat.to_csv('mean_temp_warmest_quarter.csv', index=False)

#BIO11
df_just_bio_11 = df.iloc[:, 14]
df_binned_bio11_long_lat = df_binned_long_lat
df_binned_bio11_long_lat['value'] = df_just_bio_11
#print(df_binned_bio11_long_lat)
#df_binned_bio11_long_lat.to_csv('mean_temp_coldest_quarter.csv', index=False)

#BIO12
df_just_bio_12 = df.iloc[:, 15]
df_binned_bio12_long_lat = df_binned_long_lat
df_binned_bio12_long_lat['value'] = df_just_bio_12
#print(df_binned_bio12_long_lat)
#df_binned_bio12_long_lat.to_csv('annual_precipitation.csv', index=False)

#BIO13
df_just_bio_13 = df.iloc[:, 16]
df_binned_bio13_long_lat = df_binned_long_lat
df_binned_bio13_long_lat['value'] = df_just_bio_13
#print(df_binned_bio13_long_lat)
#df_binned_bio13_long_lat.to_csv('precipitation_wettest_month.csv', index=False)

#BIO14
df_just_bio_14 = df.iloc[:, 17]
df_binned_bio14_long_lat = df_binned_long_lat
df_binned_bio14_long_lat['value'] = df_just_bio_14
#print(df_binned_bio14_long_lat)
#df_binned_bio14_long_lat.to_csv('precipitation_driest_month.csv', index=False)

#BIO15
df_just_bio_15 = df.iloc[:, 18]
df_binned_bio15_long_lat = df_binned_long_lat
df_binned_bio15_long_lat['value'] = df_just_bio_15
#print(df_binned_bio15_long_lat)
#df_binned_bio15_long_lat.to_csv('precipitation_seasonality.csv', index=False)

#BIO16
df_just_bio_16 = df.iloc[:, 19]
df_binned_bio16_long_lat = df_binned_long_lat
df_binned_bio16_long_lat['value'] = df_just_bio_16
#print(df_binned_bio16_long_lat)
#df_binned_bio16_long_lat.to_csv('precipitation_wettest_quarter.csv', index=False)

#BIO17
df_just_bio_17 = df.iloc[:, 20]
df_binned_bio17_long_lat = df_binned_long_lat
df_binned_bio17_long_lat['value'] = df_just_bio_17
#print(df_binned_bio17_long_lat)
#df_binned_bio17_long_lat.to_csv('precipitation_driest_quarter.csv', index=False)

#BIO18
df_just_bio_18 = df.iloc[:, 21]
df_binned_bio18_long_lat = df_binned_long_lat
df_binned_bio18_long_lat['value'] = df_just_bio_18
#print(df_binned_bio18_long_lat)
#df_binned_bio18_long_lat.to_csv('precipitation_warmest_quarter.csv', index=False)


#BIO19
df_just_bio_19 = df.iloc[:, 22]
df_binned_bio19_long_lat = df_binned_long_lat
df_binned_bio19_long_lat['value'] = df_just_bio_19
#print(df_binned_bio19_long_lat)
#df_binned_bio19_long_lat.to_csv('precipitation_coldest_quarter.csv', index=False)

#BIO20
df_just_bio_20 = df.iloc[:, 23]
df_binned_bio20_long_lat = df_binned_long_lat
df_binned_bio20_long_lat['value'] = df_just_bio_20
#print(df_binned_bio20_long_lat)
#df_binned_bio20_long_lat.to_csv('elevation.csv', index=False)


