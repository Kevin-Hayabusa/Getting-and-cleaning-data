# Getting-and-cleaning-data
* This is for course project Getting-and-cleaning-data
* run_analays.R is the R script for transforming the data
* tidy_data.txt is the output
* codebook.Rmd describe the transformation steps as well as the varible name

###transformation
details can be find in run_analysis.R

* download data set
* unzip and set the working dir to "UCI HAR Dataset"
* read tables from training and test tables and combined with rbind
* filter the column required using grep "mean|sd" to get the index and subset them from original dataset
* rename the column names by removing "()",",""-"
* rename the labels with more descritive names like acc -> Accelerometer, gyro >- Gyroscope
* read subject and activity table and combine them with rbind
* add the new columns (subject and activity) into the dataset with cbind
* group by the dataset with the column subject and activity
* calculate the mean for each colun using summize_each function
* write the dataset into tidy_data.txt

