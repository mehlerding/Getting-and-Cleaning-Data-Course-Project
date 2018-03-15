# Getting and Cleaning Data - Final Project

This is the final project for the Getting and Cleaning Data course.

## Associated Files

* "run_analysis.R" :  The R script file that tidys and summarizes the data.
* "CodeBook.md" : The code book file describing the identifiers, labels, and measurements for "tidy_data_means.txt"
* "tidy_data_means.txt" : The resulting data file produced from the R script file.

## Data Transformations

* read.table functions read the raw data into R from training, testing, features, and activity labels files.
* bind_cols and bind_rows functions to combine data into a single data frame called "table"
* colnames functions to provide descriptions for each measurement
* join function to translate the activity code integer to a description (factor), joining activity_labels to table
* removal of unwanted columns by creating a logical vector with the grepl function and creating a subset of the table data frame
* reordering columns for clarity
* creating a second data frame (table2) using grouping and summarize functions to calculate a mean for each subject and activity factor
* write function to create "tidy_data_means.txt" from the table2 data frame