library(readxl)
feature_counts <- read.csv("C:/Users/Ishika Gupta/Downloads/feature_matrix_length.csv")


calculate_FPKM <- function(expression_data) {
  # Check if the second column is gene length (Length)
  colname <- tolower(colnames(expression_data)[2])
  if (!colname %in% c("length", "gene_length")) {
    stop("Error: Second column must be gene length (e.g., 'Length' or 'gene_length').")
  }
  
  # Extract gene lengths (second column)
  gene_lengths <- expression_data[, 2]
  
  # Extract raw counts (third column)
  raw_counts <- expression_data[, 3, drop = FALSE]
  
  # Calculate library size (sum of Count column)
  library_sizes <- colSums(raw_counts)
  
  # Compute FPKM: Normalize by library size (per million)
  fpkm <- t(t(raw_counts) / library_sizes) * 1e6
  
  # Normalize by gene length (per kilobase)
  fpkm <- fpkm / (gene_lengths / 1000)
  
  # Rename FPKM column
  colnames(fpkm) <- "FPKM"
  
  # Return FPKM values (Geneid + FPKM)
  result <- data.frame(
    Geneid = expression_data$Geneid,
    Length = expression_data$Length,
    FPKM = fpkm
  )
  
  return(result)
}

fpkm_values <- calculate_FPKM(feature_counts)
fpkm_values
write.csv(fpkm_values, 
          file = "C:/Users/Ishika Gupta/Downloads/FPKM_results.csv",
          row.names = FALSE)
