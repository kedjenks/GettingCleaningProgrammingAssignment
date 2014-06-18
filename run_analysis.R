
# Read observation (train and test) data and combine
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
combined_data <- rbind(test_data,train_data)

# Read feature list for column titles
column_titles <- read.table("./UCI HAR Dataset/features.txt")

# add column titles
colnames(combined_data) <- column_titles[,2]

# Extract measurements that are only the mean or standard deviation
combined_data_mean <- combined_data[,grep("mean()", colnames(combined_data), fixed=TRUE)]
combined_data_std <- combined_data[,grep("std()", colnames(combined_data))]
combined_data <- cbind(combined_data_mean,combined_data_std)

# Read and combine activity info for test and train
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
combined_activity <- rbind(test_activity,train_activity)
activity_lablels <- read.table("./UCI HAR Dataset/activity_labels.txt")

activity_vec <- NULL
#create activity column vector for combined data set
for(i in seq_along(combined_data[,1])) {
     activity_vec <- rbind(activity_vec,as.character(activity_lablels[combined_activity[i,1],2]))
}

#bind activity description vector to dataset
colnames(activity_vec) <- c("Activity")
combined_data <- cbind(activity_vec,combined_data)

# add subject number to combined data
subject_number_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_number_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
combined_subject <- rbind(subject_number_test, subject_number_train)
colnames(combined_subject) <- c("Subject_Number")
combined_data <- cbind(combined_subject,combined_data)

#create more descriptive column titles
descriptive_colnames <- gsub("^t","Time_", colnames(combined_data))
descriptive_colnames <- gsub("^f","Frequency_", descriptive_colnames)
descriptive_colnames <- gsub("Body","BodyMotion_", descriptive_colnames)
descriptive_colnames <- gsub("Gravity","Gravitational_", descriptive_colnames)
descriptive_colnames <- gsub("Acc","Accelerometer_", descriptive_colnames)
descriptive_colnames <- gsub("Gyro","Gyroscope_", descriptive_colnames)
descriptive_colnames <- gsub("JerkMag","JerkMagnitude_", descriptive_colnames)
descriptive_colnames <- gsub("_Mag","_Magnitude_", descriptive_colnames)
descriptive_colnames <- gsub("-std()","StdDev_", descriptive_colnames, fixed=TRUE)
descriptive_colnames <- gsub("-mean()","Mean_", descriptive_colnames,fixed=TRUE)
descriptive_colnames <- gsub("JerkStdDev","Jerk_StdDev", descriptive_colnames)
descriptive_colnames <- gsub("JerkMean","Jerk_Mean", descriptive_colnames)
descriptive_colnames <- gsub("-X","Xaxis", descriptive_colnames)
descriptive_colnames <- gsub("-Y","Yaxis", descriptive_colnames)
descriptive_colnames <- gsub("-Z","Zaxis", descriptive_colnames)

colnames(combined_data) <- descriptive_colnames

## create melted data set - melt combined data with subject number and activity as id
combined_data_melt <- melt(combined_data,id=c("Subject_Number","Activity"))

## create tidy data set by using dcast mean aggregation.  use subject number and 
## activity as the id to combine the result into
tidy_data_set <- dcast(combined_data_melt,Subject_Number + Activity ~ variable, mean)

## Write tidy data set to text file
write.table(tidy_data_set, file="tidy_data_set.txt")




     