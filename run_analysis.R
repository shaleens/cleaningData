## extract the activity labels
activity.labels <- read.table('./UCI HAR Dataset//activity_labels.txt') [,2]



train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")

test.data <- read.table("./UCI HAR Dataset//test/X_test.txt")



cnames.data <- read.table("./UCI HAR Dataset//features.txt")
combined.data <- rbind(train.data, test.data)
names(combined.data) <- cnames.data[,2]

## Keep only the mean and the standard definition columns in the dataset
## This also retains meanFreq, I believe, should be a part of the data set
isMean <- sapply(names(combined.data), grepl,pattern='mean', ignore.case=T, USE.NAMES=F)
isStd <- sapply(names(combined.data), grepl,pattern='std', ignore.case=T, USE.NAMES=F)
colsToKeep <- isMean | isStd
combined.data <- combined.data[colsToKeep]


##add labels
train.label <- read.table("./UCI HAR Dataset/train/y_train.txt")
test.label <- read.table("./UCI HAR Dataset/test/y_test.txt")
combined.label <- rbind(train.data, train.label)
names(combined.label) <- c("activity")

combined.data <- cbind(combined.data, combined.label)


## clean up the descriptors
names(new.combined.data) <- gsub("[()+=]", "", x=names(new.combined.data))

