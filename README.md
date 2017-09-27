# Getting and Cleaning Data Week 4 Course Project

This repository contains:
* a code book that describes the variables, the data, and any transformations or work that is performed to clean up the data called CodeBook.md
* a README.md file
* an R script called as run_analysis.R which does the required work for this project. It can be run to generate the tidy data set
* tidy data set called tidydataset.txt which is created after you run the script

R script does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.* 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How to run and generate the tidy data set:
* Download and unzip the data file into your R working directory.
* Save the R script file into your R working directory.
* Run R source code to generate tidy data set called tidydataset.txt in the home directory of our data set - UCI HAR Dataset
