
# libraries ---------------------------------------------------------------

library(ggplot2)
library(ggrepel)

# import data -------------------------------------------------------------

data <- read.csv('data/species-area.csv', stringsAsFactors = T)
data <- data[-c(14,15,13),, drop = F]

# linear model ------------------------------------------------------------

lm(logSR ~ logA, data = data)
summary(lm(logSR ~ logA, data = data))
# plot(lm(logSR ~ logA, data = data))
data$res <- lm(logSR ~ logA, data = data)$res

## analysis without Craigaveagh -------------------------------------------

data_minus_Craigaveagh <- data[-1,]

lm(logSR ~ logA, data = data_minus_Craigaveagh)
summary(lm(logSR ~ logA, data = data_minus_Craigaveagh))
# plot(lm(logSR ~ logA, data = data_minus_Craigaveagh))

## plotting model ---------------------------------------------------------

p <- ggplot(data, aes(x=logA, y=logSR, col = Grazing)) +
  geom_smooth(method='lm',
              color = 'black',
              se=F,
              linewidth = 0.3) +
  geom_point() +
  geom_text_repel(aes(label=island), color='black') +
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

### save figures -----------------------------------------------------------

png('figures/log-log.png', height=2500, width=3000, res=600, bg='white')

p

dev.off()
p

svg('figures/log-log_noBG.svg', height=4, width=5, bg="transparent")
p
dev.off()

## plot residuals ---------------------------------------------------------

p2 <- ggplot(data, aes(x=logA, y=res, col = Grazing)) +
  geom_hline(yintercept = 0, color = "black") +
  geom_point() +
  geom_text_repel(aes(label=island), color='black') +
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

### save figures -----------------------------------------------------------

png('figures/25_02_residuals.png', height=2500, width=3000, res=600, bg='white')

p2

dev.off()

svg('figures/25_02_residuals.svg', height=4, width=5, bg="transparent")

p2

dev.off()
