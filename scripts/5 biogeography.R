
# libraries ---------------------------------------------------------------

library(ggplot2)
library(ggrepel)

# import data -------------------------------------------------------------

data <- read.csv('data/species-area.csv', stringsAsFactors = T)

# linear model ------------------------------------------------------------

lm(log_species_richness ~ log_area, data = data)
summary(lm(log_species_richness ~ log_area, data = data))
plot(lm(log_species_richness ~ log_area, data = data)) # diagnostic plots
data$res <- lm(log_species_richness ~ log_area, data = data)$res

## analysis without Craigaveagh -------------------------------------------

data_minus_Craigaveagh <- data[-1,]

lm(log_species_richness ~ log_area, data = data_minus_Craigaveagh)
summary(lm(log_species_richness ~ log_area, data = data_minus_Craigaveagh))
plot(lm(log_species_richness ~ log_area, data = data_minus_Craigaveagh)) # diagnostic plots

## plotting model ---------------------------------------------------------

p <- ggplot(data, aes(x=log_area, y=log_species_richness, col = grazing)) +
  geom_smooth(method='lm',
              color = 'black',
              se=F,
              linewidth = 0.3) +
  geom_point() +
  geom_text_repel(aes(label=island),
                  color='black',
                  nudge_y = -0.01,
                  force_pull = 1.5) +
  scale_color_manual(values = c("#0504aa",
                                "#c20078",
                                "#15b01a",
                                "#0b8b87",
                                "#f97306",
                                "#516572",
                                "#3d7afd")) +
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
  ylab('ln(Number of species)'
  )
p

### save figures -----------------------------------------------------------

png('figures/log-log.png', height=2500, width=3000, res=600, bg='white')
p
dev.off()

svg('figures/log-log_noBG.svg', height=4, width=5, bg="transparent")
p
dev.off()

## plot residuals ---------------------------------------------------------

p2 <- ggplot(data, aes(x=log_area, y=res, col = grazing)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_point() +
  geom_text_repel(aes(label=island),
                  color='black',
                  nudge_y = 0.01) +
  scale_color_manual(values = c("#0504aa",
                                "#c20078",
                                "#15b01a",
                                "#0b8b87",
                                "#f97306",
                                "#516572",
                                "#3d7afd")) +
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
  ylab('ln(Number of species)'
  )
p2

### save figures -----------------------------------------------------------

png('figures/25_02_residuals.png', height=2500, width=3000, res=600, bg='white')
p2
dev.off()

svg('figures/25_02_residuals.svg', height=4, width=5, bg="transparent")
p2
dev.off()
