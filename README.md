# Plants of Strangford Lough Islands

Data and code for my paper on plants and plant communities of Strangford Lough Islands. The most important script is that used to generate the figures and analyse a linear model of the Species Richness - Area relationship. This can be found at `scripts/5 biogeography.R`.

## Explanations of scripts

### `1 combine_csv_files.R`

Combine raw datasheets (records as collected in field and processed by me) into a single sheet, which is saved as `data/csv/all_records.csv`.

### `2 unknowns.R`

Make a list of records with uncertain ID, which is saved as `data/csv/unknowns.csv`.

### `3 filtering uncertain records.R`

Remove uncertain records and save the edited datasheet as `data/certain_records.csv`. Uncertain records are excluded from further analysis.

### `4 species richness data.R`

Calculate the total species richness of each island and combine this with island area and grazing data (generated from Google Earth, and field observations and interviews with landowners, respectively). Calculate the natural log of species richness and area for each island. These data are then saved as `data/species-area.csv`. Some taxa may be represented twice (e.g. `Festuca sp.` and `Festuca rubra`), so when there is a record of a genus to species level from an island, records to genus level are excluded to prevent double-counting.

### `5 biogeography.R`

![](https://github.com/jed76/strangford/blob/main/figures/log-log.png?raw=true)
![](https://github.com/jed76/strangford/blob/main/figures/25_02_residuals.png?raw=true)

*N.B.* you need to run this script line by line, as sourcing it all in one breaks the code that saves the plots, for some reason.

Run a linear model `log_species_richness ~ log_area` on the data. View summary statistics and diagnostic plots for this linear model. Extract residuals and add these to the data for each island. Run the linear model again without Craigaveagh (an outlier) to see if this affects the analysis and view summary statistics and diagnostic plots for this linear model. Including Craigaveagh does not affect the analysis in a major way.

Plot a log-log graph of Species Richness and Area, including the linear model as a line of best fit. Save this as a png and as a csv. Plot residuals and save this as a png and as a csv.


### `6 number of visits to each island.R`

![](https://github.com/jed76/strangford/blob/main/figures/log-log_by_visits.png?raw=true)
![](https://github.com/jed76/strangford/blob/main/figures/residuals_by_visits.png?raw=true)

Count the number of visits made to each island, and the relevant dates. Plot log-log graph and residuals of the linear model with islands coloured by number of visits.

