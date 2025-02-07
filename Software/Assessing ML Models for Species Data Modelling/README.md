# File Hierarchies under `./data`
data  
├── data_manipulation_for_aml_gp_maxent  
│ └── ...  
├── maxent  
│ └── ...  
├── Results  
│ ├── test.txt: individual runs  
│ ├── output.txt: the average of all the runs  
│ ├── maxentResults.csv:  
│ ├── maxentResults.xlsx:  
│ ├── maxentResults_AllBIO.csv:  
├── species_test.npz: original files  
├── species_train.npz  
├── species_extra.npz  
├── explore_species_data.py: script  
├── data_all.txt: the converted files from .npz to import into code  
├── data_train.txt  
├── data_train_extra.txt  
├── modified.txt: intermediary files to run data modelling  
└── modified_data.txt: the data after data cleansing to do further data modelling  

---

## Setting Up a Google Colab Environment

1. Go to [Google Colab](https://colab.research.google.com/).  
2. Press the button **"Add a new notebook"**.  
3. From **Files**, press **Import/Upload notebook**.  
4. Find the `.ipynb` file in `./src/models.ipynb`.

---

## Running the Models

1. Find **Archive** on the left side of the Colab interface.  
2. Import all files from `./data` (Do **not** upload the entire data archive itself).  
3. Use `Ctrl+F9` to run all cells.

---

## Report

1. You will find many PNG images for the LATEX report.  
2. The following files are included:  
   - **STY files**: `lineno`, `nicefrac`, `nips_2016`  
   - **LATEX file**: `report`  
   - **BIBTEX file**: `refs`  
