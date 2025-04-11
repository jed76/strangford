library(dplyr)
library(stringr)

records <- read.csv("data/certain_records.csv")

island_list <- c("Craigaveagh", "Darragh", "Drummond", "Great Minnis", "Green", "Inishanier", "Inisharoan", "Little Minnis", "Parton", "Rainey", "Roe", "Shamrock")

# total visits -----------------------------------------------------------------

unique(records$date)

# Number of visits to each island ----------------------------------------------

visit_data <- c()

for(island in island_list){
  island_records <- records %>%
    filter(grepl(island, site)) # filter data to records from island of interest
  
  number_of_visits <- length(unique(island_records$date))
  print(paste(island, unique(island_records$date)))
  visit_data <- rbind(visit_data, c(island, number_of_visits))
}

visit_data <- data.frame(visit_data)

# number of visits vs log-log residuals -------------------------------------------
library(ggplot2)
library(ggrepel)

data <- read.csv('data/species-area.csv', stringsAsFactors = T)
data <- merge(data, visit_data, by.x = 'island', by.y = 'X1')
data["visits"] <- data["X2"]

## linear model ------------------------------------------------------------

lm(log_species_richness ~ log_area, data = data)
data$res <- lm(log_species_richness ~ log_area, data = data)$res

p <- ggplot(data, aes(x=log_area, y=res, col = visits)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_point() +
  geom_text_repel(aes(label=island),
                  color='black',
                  nudge_y = 0.01) +
  theme(panel.background = element_rect(fill = "transparent", colour = NA),
        plot.background = element_rect(fill = "transparent", colour = NA),
        axis.title.x = element_text(color = 'black'),
        axis.title.y = element_text(color = 'black'),
        axis.ticks = element_line(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text = element_text(colour = "black"),
        legend.position = 'bottom',
        legend.background = element_blank(),
        legend.key = element_blank(),
        legend.text = element_text(color='black'),
        legend.title = element_text(color='black')) +
  xlab('ln(Area in m²)') +
  ylab('residual ln(Number of species)'
  )
p

png('figures/residuals by visits.png', height=2500, width=3000, res=600, bg='white')
p
dev.off()
