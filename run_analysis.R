rm(list = ls())
# SET WORKING DIRECTORY HERE!
wd <- "C:/Users/Sebastian/Documents/Coursera/Johns Hopkins - Data Science/3 Getting and Cleaning Data/Final Project"
getwd()
setwd(wd)

library(dplyr)

uci_activity_labels <- gsub("[0-9] ", "", as.character(unlist(read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE))))
uci_col_names <- unlist(read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE, row.names = 1))
uci_col_names <-  tolower(gsub("[,/./(/)/-]", "_", uci_col_names))
uci_col_names <- gsub("mag", "magnitude", uci_col_names)
uci_col_names <- gsub("acc", "acceleration", uci_col_names)
words <- c("gyro", "body", "jerk", "magnitude", "acceleration", "gravity")
for (word in words) {
  uci_col_names <- gsub(word, paste("_", word, "_", sep=""), uci_col_names)
}
uci_col_names <- gsub("__+", "_", uci_col_names)
uci_col_names <- gsub("(^_|_$)", "", uci_col_names)

uci_subjects_test <- unlist(read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE))
uci_activities_test <- unlist(read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE))
uci_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE, col.names = uci_col_names, row.names=NULL)
uci_test$activity <- factor(uci_activities_test,labels=uci_activity_labels)
uci_test$subject <- uci_subjects_test

uci_subjects_train <- unlist(read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE))
uci_activities_train <- unlist(read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE))
uci_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE, col.names = uci_col_names, row.names=NULL)
uci_train$activity <- factor(uci_activities_train,labels=uci_activity_labels)
uci_train$subject <- uci_subjects_train

uci <- rbind(uci_test, uci_train)
uci_reduced <- select(uci, subject, activity, matches("(mean|std)_"))
uci_reduced <- select(uci_reduced, -matches("angle"))

uci_avg_activit_per_subject <- aggregate(uci_reduced, list(uci_reduced$subject, uci_reduced$activity), mean)#[,-c(1,2)]
uci_avg_activit_per_subject <- select(uci_avg_activit_per_subject, -subject, -activity, subject = Group.1, activity = Group.2)

write.csv(uci_avg_activit_per_subject, file="human_activity_recognition_using_smartphones.csv", row.names=FALSE)
