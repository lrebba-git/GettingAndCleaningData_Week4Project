library(dplyr)

# load train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# load test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# load features
features <- read.table("./UCI HAR Dataset/features.txt")

# load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Step 1: Merges the training and the test sets to create one data set.
X_merged <- rbind(X_train, X_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
selected_measurements <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_merged <- X_merged[,selected_measurements[,1]]

# Step 3: Uses descriptive activity names to name the activities in the data set
colnames(y_merged) <- "activity"
y_merged$activitylabel <- factor(y_merged$activity, labels = as.character(activity_labels[,2]))
activitylabel <- y_merged[,-1]

# Step 4: Appropriately labels the data set with descriptive variable names.
colnames(X_merged) <- features[selected_measurements[,1],2]

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(subject_merged) <- "subject"
total <- cbind(X_merged, activitylabel, subject_merged)
tidydataset <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(tidydataset, file = "./UCI HAR Dataset/tidydataset.txt", row.names = FALSE, col.names = TRUE)
