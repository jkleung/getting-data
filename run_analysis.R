## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
# Load: activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=F,col.names=c("ID","activity_labels"))

# Load: data column names
features <- read.table("./UCI HAR Dataset/features.txt",header=F,col.names=c("ID","features"))

# Load and process X_test & y_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=F,col.names=features$features)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=F,col.names=c("activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=F,col.names=c("subjectID"))



# Load and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=F,col.names=features$features)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=F,col.names=c("activity"))

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=F,col.names=c("subjectID"))

train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanstdcols <-grepl("mean|std", names(combined))
meanstdcols[1:2] <- TRUE
combined = combined[,meanstdcols]



## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
combined$activity <- factor(combined$activity,labels=activity_labels$activity_labels)
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Load Package reshape2
if (!require("reshape2")) {
  install.packages("reshape2")
}
library(reshape2)

# Merge test and train data
melt_data      = melt(combined, id=c("subjectID","activity"))

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subjectID+activity ~ variable, mean)

#Export table to file
write.table(tidy_data, file = "./tidy_data.txt",row.name=FALSE)


