####  Read data into variables #############################################

 path_data<- file.path("./Project","UCI HAR Dataset")

activityTest<- read.table(file.path(path_data, "test" , "Y_test.txt" ),header = FALSE)
activityTrain<- read.table(file.path(path_data, "train", "Y_train.txt"),header = FALSE)

subjectTrain<- read.table(file.path(path_data, "train", "subject_train.txt"),header = FALSE)
subjectTest <- read.table(file.path(path_data, "test" , "subject_test.txt"),header = FALSE)

featuresTest<- read.table(file.path(path_data, "test" , "X_test.txt" ),header = FALSE)
featuresTrain<- read.table(file.path(path_data, "train", "X_train.txt"),header = FALSE)

# Step 1
#### Merges the training and the test sets to create one data set  ###
################################################################################

activityData<- rbind(activityTest,activityTrain)
featuresData<- rbind(featuresTest,featuresTrain)
subjectData<- rbind(subjectTest,subjectTrain)

#Step 2
#### Extracts only the measurements on the mean and standard deviation  ###### 
#### for each measurement #####################################################
###############################################################################

names(subjectData)<-c("subject")
names(activityData)<- c("activity")

dataFeaturesNames <- read.table(file.path(path_data, "features.txt"),head=FALSE)
names(featuresData)<- dataFeaturesNames$V2

allData <- cbind(activityData,subjectData,featuresData)

mean_std_features<- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", 
                                              dataFeaturesNames$V2)]

selectedNames<-c(as.character(mean_std_features), "subject", "activity" )

allData<-subset(allData,select=selectedNames)

#Step 3
####  Uses descriptive activity names to name the activities in the data set ##
###############################################################################

activityLabels<-read.table(file.path(path_data, "activity_labels.txt"),
                           header = FALSE)

allData[,"activity"]<- activityLabels[allData[,"activity"],2]

#Step 4
####  Appropriately label the data set with descriptive variable names ########
###############################################################################

names(allData)<-gsub("^t", "time", names(allData))
names(allData)<-gsub("^f", "frequency", names(allData))
names(allData)<-gsub("Acc", "Accelerometer", names(allData))
names(allData)<-gsub("Gyro", "Gyroscope", names(allData))
names(allData)<-gsub("Mag", "Magnitude", names(allData))
names(allData)<-gsub("BodyBody", "Body", names(allData))

#Step 5
###### Creates a second,independent tidy data set with the average of each ##
#####variable for each activity and each subject. and ouput it  ##############
###############################################################################

library(plyr);

groupedData<-aggregate(. ~subject + activity,allData, mean)
tidyData<- groupedData[order(groupedData$subject,groupedData$activity),]

write.table(tidyData, file = "tidydataset.txt",row.name=FALSE)




