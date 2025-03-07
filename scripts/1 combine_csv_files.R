### read csv files ##

shamrock <- read.csv("data/csv/22_08_04_shamrock.csv", stringsAsFactors = T)
shamrock2 <- read.csv("data/csv/22_08_19_shamrock.csv", stringsAsFactors = T)
shamrock3 <- read.csv("data/csv/22_08_22_shamrock.csv", stringsAsFactors = T)
parton <- read.csv("data/csv/22_08_14_parton.csv", stringsAsFactors = T)
lminnis <- read.csv("data/csv/22_08_21_lminnis.csv", stringsAsFactors = T)
roe <- read.csv("data/csv/22_04_03_roe.csv", stringsAsFactors = T)
roe2 <- read.csv("data/csv/22_08_08_roe.csv", stringsAsFactors = T)
inisharoan <- read.csv("data/csv/22_03_27_inisharoan.csv", stringsAsFactors = T)
inisharoan2 <- read.csv("data/csv/22_08_10_inisharoan.csv", stringsAsFactors = T)
inishanier <- read.csv("data/csv/22_09_09_inishanier.csv", stringsAsFactors = T)
green <- read.csv("data/csv/22_08_14_green.csv", stringsAsFactors = T)
green2 <- read.csv("data/csv/22_08_24_green.csv", stringsAsFactors = T)
gminnis <- read.csv("data/csv/22_08_14_gminnis.csv", stringsAsFactors = T)
drummond <- read.csv("data/csv/22_07_27_drummond.csv", stringsAsFactors = T)
drummond2 <- read.csv("data/csv/22_08_21_drummond.csv", stringsAsFactors = T)
drummond3 <- read.csv("data/csv/22_09_09_drummond.csv", stringsAsFactors = T)
darragh <- read.csv("data/csv/22_04_13_darragh.csv", stringsAsFactors = T)
darragh2 <- read.csv("data/csv/22_07_darragh.csv", stringsAsFactors = T)
darragh3 <- read.csv("data/csv/22_08_24_darragh.csv", stringsAsFactors = T)
craig <- read.csv("data/csv/22_09_09_craigaveagh.csv", stringsAsFactors = T)

### rbind ##

all_records <- rbind(shamrock, shamrock2, shamrock3, parton, lminnis, roe, roe2, inisharoan, inisharoan2, inishanier, green, green2, gminnis, drummond, drummond2, drummond3, darragh, darragh2, darragh3, craig)
write.csv(all_records, "data/csv/all_records.csv")