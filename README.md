# OpenSourceSoftware README

This Project's focus is on identifying whether or not poverty is racially motivated to some degree, implementing NJ Census data going back up to the past few years, and display that data through an interactive NJ county map.

The map has 2 aspects:

1. Choropleth map
   * The map itelf is color ranked by least to highest poverty percentage in 2019.
2. County interaction and display in left sidebar
   * Showing total population and percentage of population in poverty in 2014 and 2019.
   * Change in population from 2014 to 2019 for those in poverty and not in poverty, by race.

All user code and data files are within /src/2014_2019_census_data/ folder:

* /Style_layer/ folder that contains mapbox style json file
* Two xls dataset files that are the 2014 & 2019 poverty datasets that are downloaded from the US Census Bureau database
* County_Boundairies_of_NJ_EDITED.geojson - The edited county geojson file to upload to mapbox
* County_Boundairies_of_NJ.geojson - The non-edited county geojson file that only has the mapping data for the NJ counties
* County_Boundairies_of_NJ.zip - Zipped folder contains the original geospatial data files (.shp, .cpg, .shx, , etc.) which are needed to be converted into a geojson file.
* index.html - copy of the hmtl code used in /src/rails_starter/app/views/home/index.html.erb
* main.rb - ruby code file that scrapes the 2 .xls datasets and the non-edited geojson file, and adds the necessary data to the non-edited geojson file to be used with Mapbox.
* povertyNJ_logo2.png - image used in
