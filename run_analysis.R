library(data.table)

## Load the training and test sets and the activities
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip")
test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## 3. Use descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
test_act$V1 <- factor(test_act$V1,levels=activities$V1,labels=activities$V2)
train_act$V1 <- factor(train_act$V1,levels=activities$V1,labels=activities$V2)

## 4. Appropriately label the data set with descriptive variable names
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
colnames(test) <- features$V2
colnames(train) <- features$V2
colnames(test_act) <- c("Activity")
colnames(train_act) <- c("Activity")
colnames(test_sub) <- c("Subject")
colnames(train_sub) <- c("Subject")

## 1. Merge the training and test to create one data set
test <- cbind(test,test_act)
test <- cbind(test,test_sub)
train <- cbind(train,train_act)
train <- cbind(train,train_sub)
united <- rbind(test,train)

## 2. Extract only the measurements on the mean and standard deviation for each measurement
united_mean <- sapply(united,mean,na.rm=TRUE)
united_sd <- sapply(united,sd,na.rm=TRUE)

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
DT <- data.table(united)
tidy <- DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy_data_set.txt",sep=",", row.names = FALSE)
