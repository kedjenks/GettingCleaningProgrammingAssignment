GettingCleaningProgrammingAssignment - README
====================================

Programming Assignment for Coursera Getting and Cleaning Data

There is only one script for this assignment (run_analysis.R).  All of the assignment required data manipulations are contained within the sequential script.  The script reads in the necessary test and train data from the UCI HAR dataset.  It combines the test and train data into one dataset and then converts it into a tidy data set with the average of each mean() and std() variable for each activity and each subject. Ultimately, the script produces a text file called tidy_data_set.txt.

To Run:

     1) Make sure UCI HAR Dataset is extracted to a folder <working directory>/UCI HAR Dataset.
     2) Place the run_analysis.R script in the working directory.
     3) From the command line:
          source('<working directory>/run_analysis.R')
     4) The script will generate a text file called tidy_data_set.txt in <working directory>.  This text file is generated using the write.table function in R.
     5) The text file is most easily read by reading back into R using read.table.

Script Details:

The script initially reads in the test and train data from the UCI HAR dataset.  It then uses rbind to create a combined dataset.  Next, the column titles for the combined data set are created by reading in the column titles from UCI HAR Dataset/features.txt.

Next, the script greps through the column names for mean() and std() to create a data_mean and data_std data table.  These are then combined into one combined set using cbind.

Next, the script takes the activity data and activity labels and appends a new column to the start of the dataset.  The activity numbers are replaced with the activity lables.

Next, the script appends a new column to the start of the dataset that has the subject number for each row.

Next, the script uses gsub to find and replace the components of the column nambes with more descriptive titles.

Next, the dataset is melted with the Subject Number and Activity as the id.  This melted dataset is then turned into a tidy data set by using dcast with the Subject Number and Activity as the id across the variable column.  The dcast uses mean aggregation.

Lastly, the final tidy data set is write out as a text file using write.table.  It is best viewed by reading it back into R using read.table.