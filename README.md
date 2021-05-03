# PovertyNJ

This is the readme for Yash's Assignment 2 project: PovertyNJ

Project reads 2014 & 2019 NJ Counties' racial population and their below poverty population numbers, and uses that to show the racial and poverty population displacement from 2014-2019 per county. Project uses Ruby on Rails and MapBox.

Features:
1. Choropleth map
   * The map itelf is color ranked by least to highest poverty percentage in 2019.
2. County interaction and display in left sidebar
   * Showing total population and percentage of population in poverty in 2014 and 2019.
   * Change in population from 2014 to 2019 for those in poverty and of the total population, by race.


For Usage, refer to this repository's [wiki](https://github.com/dhayalytcnj/PovertyNJ/wiki/How-to-Use-or-Contribute)

![alt text](https://github.com/dhayalytcnj/PovertyNJ/blob/f0949a5c1cf3e2b810880568d16db270c0bd6919/docs/mainpage%20pic.PNG)


# /docs/ Folder
This contains the key documents pertaining to the project, as well as pictures for usage.

# /src/ Folder
this folder can be broken down to 2 components
* user-related data and code within /2014_2019_census_data/
* Ruby on Rails starter kit within /rails_starter/

# /2014_2019_census_data/ Folder
All user code and data files are within /src/2014_2019_census_data/ folder:

* /Style_layer/ folder that contains mapbox style json file
* 2 .xls dataset files that are the 2014 & 2019 poverty datasets that are downloaded from the US Census Bureau database
* County_Boundairies_of_NJ_EDITED.geojson - The edited county geojson file to upload to mapbox
* County_Boundairies_of_NJ.geojson - The non-edited county geojson file that only has the mapping data for the NJ counties
* County_Boundairies_of_NJ.zip - Zipped folder contains the original geospatial data files (.shp, .cpg, .shx, , etc.) which are needed to be converted into a geojson file.
* index.html - copy of the hmtl code used in /src/rails_starter/app/views/home/index.html.erb
* main.rb - ruby code file that scrapes the 2 .xls datasets and the non-edited geojson file, and adds the necessary data to the non-edited geojson file to be used with Mapbox.
* povertyNJ_logo2.png - copy of image used in /src/rails_starter/app/assets/images/ folder.
