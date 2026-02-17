# Code Documentation
Project: Prediction of Gene Expression Using Histone Modification Levels at Promoters

This README documents only the code files used in the project. Detailed background,
methodology, and results are provided in the Project Description document.

--------------------------------------------------
Directory Structure
--------------------------------------------------

code/
├── FOMB_prediction.ipynb
├── FPKM_Table.R
├── FPKM_Geneids_code.R

--------------------------------------------------
Code Files Description
--------------------------------------------------

1. FPKM_Table.R
   - Purpose:
     Calculates gene expression values in FPKM from raw read counts.
   - Input:
     CSV file containing Gene ID, gene length, and raw read counts.
   - Output:
     FPKM_results.csv

2. FPKM_Geneids_code.R
   - Purpose:
     Annotates Ensembl Gene IDs with HGNC gene symbols using biomaRt.
   - Input:
     FPKM_results.csv
   - Output:
     FPKM_with_GeneNames.csv

3. FOMB_prediction.ipynb
   - Purpose:
     Predicts gene expression using promoter histone modification features.
   - Steps:
     - Data preprocessing
     - Feature correlation analysis
     - Model training and validation
     - Residual calculation
     - Comparison with RNA half-life
   - Output:
     Model performance metrics and plots.

--------------------------------------------------
Execution Order
--------------------------------------------------

1. Run FPKM_Table.R
2. Run FPKM_Geneids_code.R
3. Run FOMB_prediction.ipynb
