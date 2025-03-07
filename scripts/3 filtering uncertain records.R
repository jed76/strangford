data <- read.csv("data/csv/all_records.csv")

data_filtered <- data[!grepl("?", data$taxon, fixed = TRUE),]
