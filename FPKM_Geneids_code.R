# Install if missing
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("biomaRt")

library(biomaRt)

# Load your CSV
df <- read.csv("FPKM_results.csv", stringsAsFactors = FALSE)

# Connect to Ensembl (human genes GRCh38)
mart <- useEnsembl(biomart = "ensembl", dataset = "hsapiens_gene_ensembl")

# Query gene names
annot <- getBM(
  attributes = c("ensembl_gene_id", "hgnc_symbol"),
  filters = "ensembl_gene_id",
  values = df$Geneid,
  mart = mart
)

# Merge with your file
merged <- merge(df, annot, by.x="Geneid", by.y="ensembl_gene_id", all.x=TRUE)

# Save output
write.csv(merged, "FPKM_with_GeneNames.csv", row.names = FALSE)

cat("\n✔ Conversion complete! Saved as: FPKM_with_GeneNames.csv\n")
