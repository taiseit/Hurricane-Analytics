# Hurricane Analytics

## Table of Contents

* <a href="https://github.com/taiseit/Hurricane-Analytics/blob/master/report/storms-taisei-tateno.md">View the final report here</a>
* [About the Project](#about-the-project)
  * [Objective](#objective)
  * [Built With](#built-with)
  * [Methodology](#methodology)
* [Images](#images)
* [Contact](#contact)
  
## About the Project

### Objective
The goal of this project is to utilize R and UNIX to consolidate, analyze, and visualize Hurricane data from the _International Best Track Archive for Climate Stewardship (IBTrACS)_ and to deliver the findings in the form of a narrative based report.

### Built With
* R
* readr
* ggplot2
* dplyr
* lubridate
* Unix Bash

### Methodology

Storm data was downloaded from the <a href="https://www.ncdc.noaa.gov/ibtracs/index.php?name=climatology">IBTrACS</a> website for the years 2010 - 2015 and merged into a single CSV file (data/ibtracs-2010-2015.csv) using bash pipes and redirections. A <a href="https://github.com/taiseit/Hurricane-Analytics/blob/master/data/ibtracs-dictionary.md">Data Dictionary</a> was then created to define the parameters of the CSV. Next, the file <a href='https://github.com/taiseit/Hurricane-Analytics/blob/master/code/make-ibtracs-data-script.txt'>make-ibtracs-data-script<a> was created to execute bash commands to obtain summary statistics on the data and the output was directed to the <a href='https://github.com/taiseit/Hurricane-Analytics/tree/master/output'>output<a> directory. Then, the R file <a href='https://github.com/taiseit/Hurricane-Analytics/blob/master/code/eda-script.R'>eda-script.R<a> was created to import the data into R and to conduct Exploratory Data Analysis. The visualizations created from this process were then stored under the <a href='https://github.com/taiseit/Hurricane-Analytics/tree/master/images'>images<a> directory. Finally, a <a href="https://github.com/taiseit/Hurricane-Analytics/blob/master/report/storms-taisei-tateno.md">report</a>
 was created to summarize the key findings in a narrative based format. 
 
## Images
<img src="images/map-all-storms.png"></img> <br>

## Contact
Name: Taisei Tateno <br>
Personal Website: https://taiseit.github.io <br> 
Email: tjt (at) berkeley (dot) edu <br>
  

