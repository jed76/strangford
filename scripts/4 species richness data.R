library(dplyr)

records <- read.csv("data/certain_records.csv")
island_data <- read.csv("data/area_and_grazing_data.csv")

island_list <- c("Craigaveagh", "Darragh", "Drummond", "Great Minnis", "Green", "Inishanier", "Inisharoan", "Little Minnis", "Parton", "Rainey", "Roe", "Shamrock")

# counting species richness, calculate logs -----------------------------------------------

for(island in island_list){
  island_records <- records %>%
    filter(grepl(island, site)) # filter data to records from island of interest
  
  island_taxa <- unique(island_records$taxon)[order(unique(island_records$taxon))] # make list of taxa, in alphabetical order
  
  island_data[island_data$island == island,]$species_richness <- length(island_taxa)
  island_data[island_data$island == island,]$log_species_richness <- log(length(island_taxa))
  island_data[island_data$island == island,]$log_area <- log(island_data[island_data$island == island,]$area)
  
}

write.csv(island_data, "data/species-area.csv", row.names = F)
