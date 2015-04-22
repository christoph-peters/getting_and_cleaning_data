#1. Merges the training and the test sets to create one data set.

train_features <- read.table("data/UCI_HAR_Dataset/train/X_train.txt")
train_sub <- read.table("data/UCI_HAR_Dataset/train/subject_train.txt")
train_activity <- read.table("data/UCI_HAR_Dataset/train/y_train.txt")

test_features <- read.table("data/UCI_HAR_Dataset/test/X_test.txt")
test_sub <- read.table("data/UCI_HAR_Dataset/test/subject_test.txt")
test_activity <- read.table("data/UCI_HAR_Dataset/test/y_test.txt")

merged_features <- rbind(train_features, test_features)
merged_sub <- rbind(train_sub, test_sub)
merged_activity<- rbind(train_activity, test_activity)

activity_labels <- read.table("data/UCI_HAR_Dataset/activity_labels.txt")
features <- read.table("data/UCI_HAR_Dataset/features.txt")

colnames(merged_features) <- t(features[2])
colnames(merged_sub) <- "Subjects"
colnames(merged_activity) <- "Activities"

combined_data <- cbind(merged_features,merged_activity,merged_sub)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
selected_col <-c(grep("Mean|Std", names(combined_data), ignore.case=TRUE), 562, 563)
selected_data <- combined_data[,selected_col]

#3. Uses descriptive activity names to name the activities in the data set

numbers<-activity_labels[,1]
names(numbers) <-  activity_labels[,2]


for(i in seq_along(selected_data$"Activities")){
  selected_data$"Activities"[i] <-names(numbers[as.numeric(selected_data$"Activities"[i])])
}

#4. Appropriately labels the data set with descriptive variable names. 
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
names(selected_data) <- gsub("Freq", "Frequency", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyrometer", names(selected_data))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
agg_selected_data <- aggregate(. ~ Subjects + Activities, data=selected_data, FUN = mean)
write.table(agg_selected_data, file = "TidyData.txt", row.names = FALSE)

