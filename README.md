# Rana_draytonii_SSA

Mila Pruiett demo of GH repo of R. draytonii for ADS 2023

## Overview

- Creating Species Occurence Maps and Species Distribution Models for Species Status Assessment of Rana draytonii
- Mila Pruiett
- Completed March 6, 2023

## Dependencies 

The following  R packages are required (these will be installed in each file where necessary):
- raster
- dismo
- spocc
- rJava
- tidyverse
- maps
- maptools

## Structure

### Data
  + wc2-5: climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org) (_note_: this folder is not under version control, but will be created by running the setup script (`scr/setup.R`))
  + cmip5: forcast climate data at 2.5 minute resolution from [WorldClim](http://www.worldclim.org). The data are for the year 2070, based on the IPSL-CM5A-LR model with an RCP of 4.5 CO<sub>2</sub>. For an examination of different forecast models, see [McSweeney et al. 2015](https://link.springer.com/article/10.1007/s00382-014-2418-8). To choose a different one, see the [documentation on WorldClim](http://www.worldclim.com/cmip5_5m)(_note_: this folder is not under version control, but will be created by running the currentsdm script (`scripts/futuresdm.R`)) 
  + cleanrana.csv: data harvested from [GBIF](https://www.gbif.org/) and [iNaturalist](https://www.inaturalist.org) for _Rana draytonii_. This dataset is not under version control, but will be harvested by running `scripts/dataaquisitioncleaning.R`.
  
### Outputs
+ output (contents are not under version control)
  + occurancemap.jpeg
  + currentsdm.jpeg
  + futuresdm.jpeg
  + maxent_outputs

### Scripts
+ scripts (directory containing R scripts for gathering occurrence data, running forecast models, and creating map outputs)
  + `dataaquisitioncleaning.R` for obtaining the GBIF data
  + `occurancemap.R` to create the occurance map of the GBIF data
  + `currentsdm.R` to run a maxent model and generate a current sdm
  + `futuresdm.R` to generate a future sdm, in 70 years under IP model 
 
### Homework
+ organization of homeworks
+ describe here how you orgnized it, and what each assignment you included was


## Running the code
- Run the scripts in the following order
1. `dataaquisitioncleaning.R`
2. `occurancemap.R`
3. `currentsdm.R`
4. `futuresdm.R`



