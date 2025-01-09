*Use Code instead of Preview to see this README file*

- File hierarchies under `./data`
data
├── data_manipulation_for_aml_gp_maxent
│   └── ...
├── maxent
│   └── ...
├── Results
│   ├── test.txt: individual runs
│   ├── output.txt: the average of all the runs
│   ├── maxentResults.csv: 
│   ├── maxentResults.xlsx: 
│   ├── maxentResults_AllBIO.csv: 
├── species_test.npz: original files
├── species_train.npz
├── species_extra.npz
├── explore_species_data.py: script
├── data_all.txt: the converted files from .npz to import into code
├── data_train.txt
├── data_train_extra.txt
├── modified.txt: intermediary files to run data modelling
└── modified_data.txt: the data after data cleansing to do further data modelling



- setup a google colab environment
  1. go to https://colab.research.google.com/
  2. press the button "Add a new notebook"
  3. From Files, press import/upload notebook
  4. find the ipynb file in './src/models.ipynb'

- Run the models 
  1. Find Archieve at the left side
  2. Import all files in './data'(Do not upload data archieve itself) 
  3. Using "Ctrl+F9" to run all

- Report
  1. You will find lots of PNG image for LATEX report
  2. There's STY files(lineno, nicefrac, nips_2016), LATEX file(report), BIBTEX file(refs) included

