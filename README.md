# Getting-and-cleaning-data-courseProject

The purpose of this project is to prepare tidy data that can be used for later analysis.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 R script called run_analysis.R that does the following:-

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

WHAT YOU WILL FIND IN THE REPO :-

1) README.md :- Explains how all of the scripts work and how they are 			connected.
2) CodeBook.md :- Code book that describes the variables, the data, and any transformations 
			or work that have been performed to clean up the data.
3) run_analysis.R :- R script to transform raw data into tidy one.
4) tidydataset.txt :- a tidy data set output after running above script.

HOW TO CREATE THE TIDY DATA SET :-

1) clone this repository using the command "git clone git@github.com/MitaliBo/Getting-and- 
    cleaning-data-courseProject.git"
2) download the compressed data from the link given above
3) unzip the data and copy the UCI HAR Dataset folder to the cloned root repository inside a 
    Project folder.
4) open R console and set the working directory to the root repository using setwd() command.
5) source run_analysis.R script using source('run_analysis.R') command. It requires Plyr
   package so first install if not already installed.
6) In the root repository you will find tidydataset.txt file having tidy data.


