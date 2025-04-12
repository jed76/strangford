library(dplyr)
library(stringr)

records <- read.csv("data/certain_records.csv")
island_data <- read.csv("data/area_and_grazing_data.csv")

island_list <- c("Craigaveagh", "Darragh", "Drummond", "Great Minnis", "Green", "Inishanier", "Inisharoan", "Little Minnis", "Parton", "Rainey", "Roe", "Shamrock")

# calculated species richness of each island; calculate logs -------------------

for(island in island_list){
  island_records <- records %>%
    filter(grepl(island, site)) # filter data to records from island of interest
  
  island_taxa <- unique(island_records$taxon)[order(unique(island_records$taxon))] # make list of taxa, in alphabetical order
  island_taxa <- word(island_taxa, 1,2, sep=" ")
  island_taxa <- island_taxa[!is.na(island_taxa)]
  island_taxa <- unique(island_taxa)
  
  # Some taxa may be represented twice (e.g. "Polygonum sp." and "Polygonum aviculare agg."). We shouldn't count Genus sp. if there is another taxon in the same genus.
  uncertain_taxa <- island_taxa[grepl("sp.", island_taxa, fixed = T)]
  
  # count number of taxa being counted twice
  duplicates <- 0
  for (taxon in uncertain_taxa){
    genus <- word(taxon, 1, sep=" ")
    genus_taxa <- island_taxa[grepl(genus, island_taxa, fixed = T)]
    
    if (length(genus_taxa) > 1){
      duplicates = duplicates + 1
    }
  }
  
  island_data[island_data$island == island,]$species_richness <- length(island_taxa)-duplicates
  island_data[island_data$island == island,]$log_species_richness <- log(length(island_taxa)-duplicates)
  island_data[island_data$island == island,]$log_area <- log(island_data[island_data$island == island,]$area)
  
}

write.csv(island_data, "data/species-area.csv", row.names = F)

# total number of taxa in the area  --------------------------------------------

taxa <- unique(records$taxon)[order(unique(records$taxon))] # make list of taxa, in alphabetical order
taxa <- word(taxa, 1,2, sep=" ")
taxa <- taxa[!is.na(taxa)]
taxa <- unique(taxa)

# Some taxa may be represented twice (e.g. "Polygonum sp." and "Polygonum aviculare agg."). We shouldn't count Genus sp. if there is another taxon in the same genus.
uncertain_taxa <- taxa[grepl("sp.", taxa, fixed = T)]

# count number of taxa being counted twice
duplicates <- 0
for (taxon in uncertain_taxa){
  genus <- word(taxon, 1, sep=" ")
  genus_taxa <- taxa[grepl(genus, taxa, fixed = T)]
  
  if (length(genus_taxa) > 1){
    duplicates = duplicates + 1
  }
}

species_richness <- length(taxa)-duplicates
species_richness
