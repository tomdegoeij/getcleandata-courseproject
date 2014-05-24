Readme for getcleandata-courseproject
=====================================

Description
-----------
This is a repository supporting the [Getting and Cleaning Data course on Coursera](https://class.coursera.org/getdata-003). `run_analysis.R` can be used when the contents of the zipped UCI HAR dataset as provided on the Coursera project page is in the working directory of R.

Usage
-----
Load the R script in R using the following command:
`source("run_analysis.R")`
This will use the data from the UCI HAR dataset to create two data frames:
* `DataSet`: A data frame containing all observations in both the training subjects and test subjects, for all six types of activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`). Only the variables that contain information regarding the mean or standard deviation for a given measurement are taken into account. The first column in the dataset contains the `Subject`, the second column contains the `Activity`, the columns 3 to 68 contain the means and standard deviations of the various measuremens.
* `TidyDataSet`: Same as `DataSet`, but for every unique combination of `Subject` and `Activity` there is only one record, containing the means of the measurements from `DataSet`. In other words: the means of the mean measurements and the means of the standard deviation, per unique combination of `Subject` and `Activity`. In order to calculate means of the mean or means of the standard deviation, missing values were omitted on a per-column basis.

Inner works
-----------
`run_analysis.R` consists of the following steps:
* Read labels from `activity_labels.txt` and `features.txt` in the UCI HAR dataset
* Read data from `subject_test.txt`, `x_test.txt`, `y_test.txt`, `subject_train.txt`, `x_train.txt` and `y_train.txt` from UCI HAR dataset
* Combine this data in a single data frame called `DataSet` with appropriate column names
* Apply labels from activity_labels.txt and features.txt to this DataSet
* Ommit columns not containing ether `Subject`, `Activity`, a mean measurement or a standard deviation measurement bases on variable names of UCI HAR files. Only the following variables are included:
 * `Subject`
 * `Activity`
 * Any variable containing `.mean` (not being `.meanFreq`) or `.std`
* Splitting `DataSet` into a list containing seperate data frames for each unique combination of subject and activity
* Calculating means for all columns in every data frame in the list, except for `Subject` and `Activity`, omitting missing values on a per-column basis.
* Aggregating the column means into a new data frame called `TidyDataSet`