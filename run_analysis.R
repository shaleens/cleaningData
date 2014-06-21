library(reshape2)

## extract the activity labels
activity.labels <- read.table('./UCI HAR Dataset//activity_labels.txt') [,2]



train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")

test.data <- read.table("./UCI HAR Dataset//test/X_test.txt")



cnames.data <- read.table("./UCI HAR Dataset//features.txt")
combined.data <- rbind(train.data, test.data)
names(combined.data) <- cnames.data[,2]

## Keep only the mean and the standard definition columns in the dataset
## This removes meanFreq too, as I believe that is the wording of the problem statement
isMean <- sapply(names(combined.data), grepl,pattern='mean', ignore.case=T, USE.NAMES=F)
isStd <- sapply(names(combined.data), grepl,pattern='std', ignore.case=T, USE.NAMES=F)
isMeanFreq <- sapply(names(combined.data), grepl, pattern='meanFreq', ignore.case=T, USE.NAMES=F)
colsToKeep <- (isMean | isStd) & !isMeanFreq
combined.data <- combined.data[colsToKeep]


##add labels
train.label <- read.table("./UCI HAR Dataset/train/y_train.txt")
test.label <- read.table("./UCI HAR Dataset/test/y_test.txt")
combined.label <- rbind(train.label, test.label)
names(combined.label) <- c("activity")

combined.data <- cbind(combined.data, combined.label)


## clean up the descriptors
names(combined.data) <- gsub("[()+=]", "", x=names(combined.data))

## replacing the integer representation of activity with the string factor
## representation
combined.data$activity <- as.vector(activity.labels[combined.data$activity])


##Adding subject column to the dataset
subject.train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

subject.data <- rbind(subject.train, subject.test)
names(subject.data) <- c("subject")

combined.data <- cbind(combined.data, subject.data)
## write the first tidy data set down to tidyDataset1.txt
write.table(combined.data, "tidyDataset1.txt")

## rownames will be unique descriptors for the data
combined.melt <- melt(combined.data, id=c("activity","subject"))
combined.cast <- dcast(combined.melt, activity + subject ~ variable, mean)
rownames(combined.cast) <- paste(combined.cast$subject,combined.cast$activity, sep=",")
combined.cast.uniqueID <- rownames(combined.cast)
names(combined.cast.uniqueID) <- c("uniqueID")
combined.cast <- cbind(combined.cast.uniqueID, combined.cast)
write.table(combined.cast, "tidyDataset2.txt")
