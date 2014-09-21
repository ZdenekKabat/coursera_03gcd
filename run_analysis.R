setwd("~/Learning/Coursera/03_getting_and_cleaning_data")

# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, "./assign_data.zip")
# unzip("./assign_data.zip")

# extracts raw data and column names from source files

features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt",
                       col.names = c("Activity_id", "Activity"))

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
names(x_train) <- features[,2]
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE,
                     col.names = "Activity_id")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                        header = FALSE, col.names = "Subject")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
names(x_test) <- features[,2]
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE,
                     col.names = "Activity_id")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                        header = FALSE, col.names = "Subject")

# merges activity, subject and data columns and merges test and train sets

data_full <- rbind(cbind(sub_train, y_train, x_train), 
                   cbind(sub_test, y_test, x_test))

# removes raw data from memory

rm(list = c("x_train", "y_train", "sub_train", "x_test", "y_test", "sub_test"))

# selects only mean and standard deviation variables, excluding "meanFreq"

data_part <- data_full[,sort(c(1, 2,
     setdiff(union(grep("mean", names(data_full)), 
                   grep("std", names(data_full))),
             grep("meanFreq", names(data_full)))))]

# replaces activity IDs with activity names

data_part <- merge(data_part, activity, sort=FALSE)[,c(69, 2:68)]

# renames variables

names(data_part) <- gsub("Acc", "Accelerometer", names(data_part))
names(data_part) <- gsub("Gyro", "Gyroscope", names(data_part))
names(data_part) <- gsub("\\(\\)","", names(data_part))

# aggregates data by subject and activity and renames variables accordingly

data_summ <- aggregate(data_part[,3:68], 
                       by = list(data_part$Subject, data_part$Activity), mean)
names(data_summ)[c(1, 2)] <- c("Subject", "Activity")
names(data_summ)[3:68] <- paste("avg", names(data_summ), sep="_")[3:68]

# exports the data in a file

write.table(data_summ, file = "proj_output.txt", row.name = FALSE)
