# PovertyNj

This is the readme for Yash's Assignment 2 project: PovertyNJ

Project reads 2014 & 2019 NJ Counties' racial population and their below poverty population numbers, and uses that to show the racial and poverty population displacement from 2014-2019 per county.

![alt text](https://github.com/dhayalytcnj/PovertyNJ/blob/f0949a5c1cf3e2b810880568d16db270c0bd6919/docs/mainpage%20pic.PNG)


# src/2014-2019_census_data/
This folder contains:
* The 2 datasets from the US Census Bureau database (as .xls files)
* Non-edited GeoJSON file of the counties of NJ
* Edited GeoJSON file of the counties of NJ with the added properties to push to the MapBox API
* Zipped folder containing the necessary geospatial files (Shapefile, etc.) that are converted into the non-edited GeoJSON file
* "main.rb" ruby file that contains the code to edit the non-edited GeoJSON into the edited GeoJSON
* A copy of the HTML file already in the rails starter to work on.
* Base readme.
