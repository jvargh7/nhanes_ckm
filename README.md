# Undiagnosed and Untreated CKM in the United States

## Folder Structure

### ~/data

- Order of code as ncdat01_, ncdat02_...
- Merge downloaded datasets from path_nhanes_ckm_folder/working/raw 
- write to path_nhanes_ckm_folder/working/cleaned
- Each dataset has one .R/.py script

### ~/preprocessing

- Order of code as ncpre01_, ncpre02_ ....
- Harmonize variables across waves
    - Variable names 
    - Variable units (e.g. HbA1c)
    - Variable levels (e.g. race & ethnicity)
    
- write to path_nhanes_ckm_folder/working/processed
- Every script should output a dataset or feed into another script

### ~/analysis

- Order of code as ncana01_, ncana02_...
- Develop analytic sample based on research question and generate flowchart
- Generate table 1 using any package or alternatively use https://github.com/jvargh7/functions/blob/main/nhst/table1_summary.R
- Every script should output 
    - a dataset as .RDS or 
    - a csv file of results
    
### ~/paper

- No specific order of code...
- Every file should start with one of the following
    - table_ : Table output ready for copy-pasting into word table shell
    - figure_: Figure output ready for copy pasting into word 
    - (less preferred) text_: Text output as a csv file that is ready for plugging in numbers into abstract or Results section

### ~/functions

- Any custom functions that you write

### ~/qc

- Any quality checks outside of ~/preprocessing and ~/analysis
