all_records <- read.csv("data/csv/all_records.csv", stringsAsFactors = T)
unknowns <- all_records[grepl("?", all_records$taxon, fixed = T),]
unknowns <- unique(unknowns[["taxon"]])
unknowns <- as.character(unknowns)
unknowns <- unknowns[order(names(setNames(unknowns,unknowns)))]
write.csv(unknowns, "data/csv/unknowns.csv", row.names = F)