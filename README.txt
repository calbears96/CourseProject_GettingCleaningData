================================
Getting and Cleaning Data Course Project
Version 1.0
================================

Data is based on Human Activity Recognition Using Smartphones Dataset. It includes:
    1) x_train
    2) y_train
    3) x_test
    4) y_test
    5) subject_train
    6) subject_test
    7) features.txt

Goal is to combine all the datasets above into one tidy dataset. The data in the
x_test/train data contains sensor signal data (3 axis linear acceleration, gyroscope)
for axial linear acceleration (x, y, and z) and angular velocity. 

The dataset includes the following files:
==============================

- README.txt

- CodeBook.Rmd: a description of the data in the dataset (Alldata_tidy)

- run_analysis.R: an R script that creates the completed tidy dataset from the raw files.
      Steps:
      1) Read in the x_test, y_test, subject_test, x_train, y_train, subject_train data
      2) Read in the features.txt to obtain column names for step 1 (x_test, x_train)
      3) combine test and train data using rbind (x_train, x_test) [in this order]
      4) Determine the columns in the resulting data that are either mean or SD
      5) Subset the data (X data) so that it contains only mean/SD related columns
      6) Combine the subject data with the X data using cbind
      7) Read in the activity labels and then replace the values in y_test/train
         with the corresponding activity labels
      8) Combine the y_test/y_train data using rbind
      9) Combine X and Y data using rbind
      10) Rename the data columns in the resulting combined data to be descriptive
      11) Create Alldata_tidy by piping the dataset in step 10 into group_by (dplyr)
          using Subject and Activity columns as the grouping variables and then
          piping into summarize to calculate the mean of the other columns

- Alldata_tidy: the tidy dataset created from run_analysis.R. This data is tidy because:
      1) each variable forms a column,
      2) each observation forms a row, and
      3) each type of observational unit forms 	a table.

      An observation is a subject in an activity. The resulting dataset is long,
      rather than wide.
