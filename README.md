# CourseProject_GettingCleaningData

----------------------------------------
Getting and Cleaning Data Course Project
Version 1.0
----------------------------------------

Data is based on Human Activity Recognition Using Smartphones Dataset. It includes:
    * x_train
    * y_train
    * x_test
    * y_test
    * subject_train
    * subject_test
    * features.txt

Goal is to combine all the datasets above into one tidy dataset. The data in the
x_test/train data contains sensor signal data (3 axis linear acceleration, gyroscope)
for axial linear acceleration (x, y, and z) and angular velocity. 

The dataset includes the following files:
----------------------------------------

- README.txt

- CodeBook.Rmd: a description of the data in the dataset (Alldata_tidy)

- run_analysis.R: an R script that creates the completed tidy dataset from the raw files.
      Steps:
      * Read in the x_test, y_test, subject_test, x_train, y_train, subject_train data
      * Read in the features.txt to obtain column names for step 1 (x_test, x_train)
      * combine test and train data using rbind (x_train, x_test) [in this order]
      * Determine the columns in the resulting data that are either mean or SD
      * Subset the data (X data) so that it contains only mean/SD related columns
      * Combine the subject data with the X data using cbind
      * Read in the activity labels and then replace the values in y_test/train
         with the corresponding activity labels
      * Combine the y_test/y_train data using rbind
      * Combine X and Y data using rbind
      * Rename the data columns in the resulting combined data to be descriptive
      * Create Alldata_tidy by piping the dataset in step 10 into group_by (dplyr)
          using Subject and Activity columns as the grouping variables and then
          piping into summarize to calculate the mean of the other columns

- Alldata_tidy: the tidy dataset created from run_analysis.R. This data is tidy because:
      * each variable forms a column,
      * each observation forms a row, and
      * each type of observational unit forms 	a table.

      An observation is a subject in an activity. The resulting dataset is long,
      rather than wide.
