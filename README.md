### Introduction: 

This repository hosts the R code for the peer assessment project of the Getting and Cleaning Data course.

The course project aims to demonstrate collection, manipulation with testing and training data sets and cleaning of a united (testig and training) data set. The tidy data was prepared for use in further analysis.

### Data Set: 

The data set "Human Activity Recognition Using Smartphones" was taken from [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It is also stored in the `UCI HAR Dataset/` directory.

### Files: 

The `CodeBook.md` describes the variables, the data and the code that was run to clean the data.

 The `run_analysis.R` is the script that was used for this assessment. It can be loaded in R/Rstudio and executed without any parameters.

The output of running the script is the `tidy_data_set.txt` file that stores the data (mean and standard deviation of each measurement for each measurement) for further analysis.