data <- read.csv("data/csv/all_records.csv")

data_filtered <- data[!grepl("?", data$taxon, fixed = TRUE),]

write.csv(data_filtered, "data/certain_records.csv", row.names = F)


filtered_taxa <- unique(data_filtered[["taxon"]])
filtered_taxa <- as.character(filtered_taxa)
filtered_taxa <- filtered_taxa[order(names(setNames(filtered_taxa,filtered_taxa)))]
