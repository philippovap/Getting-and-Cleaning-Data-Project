## loading the data into R
# train set
library(dplyr)
subject_train<-read.table("./train/subject_train.txt",header=FALSE)
X_train<-read.table("./train/X_train.txt",header=FALSE)
y_train<-read.table("./train/y_train.txt",header=FALSE)  
data_train<-data.frame(subject_train,y_train,X_train)

# test set
subject_test<-read.table("./test/subject_test.txt",header=FALSE)
X_test<-read.table("./test/X_test.txt",header=FALSE)
y_test<-read.table("./test/y_test.txt",header=FALSE)
data_test<-data.frame(subject_test,y_test,X_test)

# merging the train and test sets
data<-rbind(data_train,data_test)

## renaming the columns of new data
features<-read.table("./features.txt")
features<-as.character(features[,2])
names(data)[3:ncol(data)]<-features
names(data)[1:2]<-c("id","activity")


## transforming activity in numbers into activity labels
data$activity<-as.factor(data$activity)
activity_labels<-as.factor(read.table("./activity_labels.txt",header=FALSE)[,2])
levels(data$activity)<-activity_labels

## exctract mean and standard deviation
meanstdcolumns<-grep("(mean()|std())[^meanFreq]",names(data))
data_mean_sd<-data[,c(1,2,meanstdcolumns)]

## appropriate names for columns
names(data_mean_sd)<-sub(pattern = "^f",replacement = "Frequency",names(data_mean_sd))
names(data_mean_sd)<-sub(pattern = "BodyBody",replacement = "Body",names(data_mean_sd))
names(data_mean_sd)<-sub(pattern = "Acc",replacement = "Accelerometer",names(data_mean_sd))
names(data_mean_sd)<-sub(pattern = "^t",replacement = "Time",names(data_mean_sd))
names(data_mean_sd)<-sub("Mag", "Magnitude",names(data_mean_sd))
names(data_mean_sd)<-sub("mean()", "Mean",names(data_mean_sd))
names(data_mean_sd)<-sub("std()", "SD",names(data_mean_sd))

## second, independent tidy data set with the average
## of each variable for each activity and each subject.
newdata<-aggregate(.~activity+id, data_mean_sd, mean)

