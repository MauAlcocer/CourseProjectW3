# Course Project Week 3

rm(list=ls())
memory.limit(4000)

setwd("C:/Users/Luis Mauricio/Desktop/Coursera Data Science/Getting and cleaning data/Week 3/Course Project")

# 1. Merges the training and the test sets to create one data set.
# Import the data tables of train and test observations, with their 
# corresponding subject and activity indicators. Also, the features 
# dataset with the names of variables in the train and test sets

# Import the train data set, with subject and activity indicators.
train<-read.table("UCI HAR Dataset/train/X_train.txt")
subj_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

# Import the test data set, with subject and activity indicators.
test<-read.table("UCI HAR Dataset/test/X_test.txt")
subj_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

# Import the features dataset
feat<-read.table("UCI HAR Dataset/features.txt")
names<-as.character(feat$V2)

# assigning correct variable names to train dataset 
colnames(train)<-names

colnames(subj_train)<-"subj"
colnames(y_train)<-"y"

# merging train data with subject and activities indicators
train_subj<-cbind(train,subj_train)
train_subj_y<-cbind(train_subj,y_train)

#  assigning correct variable names to test dataset
colnames(test)<-names

colnames(subj_test)<-"subj"
colnames(y_test)<-"y"

# merging train data with subject and activities indicators
test_subj<-cbind(test,subj_test)
test_subj_y<-cbind(test_subj,y_test)

# merge train and test datasets
train_test<-rbind(train_subj_y,test_subj_y)

# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 

# Use grep to subset variables that estimate mean and std
mean_std<-c(grep("mean()",names(train_test),value=TRUE),
grep("std()",names(train_test),value=TRUE))

# Select relevant variables in the dataset
train_test_mean_std<-subset(train_test,select=c(mean_std,"subj","y"))

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 

# Assign labels to activities
train_test_mean_std$y1<-factor(train_test_mean_std$y,
                               levels=c(1,2,3,4,5,6),
                               labels=c("WALKING",
                                        "WALKING_UPSTAIRS",
                                        "WALKING_DOWNSTAIRS",
                                        "SITTING",
                                        "STANDING",
                                        "LAYING"))

# Rename variables for subject, activity code and activity as factor
colnames(train_test_mean_std)[80]<-"subject"
colnames(train_test_mean_std)[81]<-"activity.code"
colnames(train_test_mean_std)[82]<-"activity.factor"


# 5.From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

data<-train_test_mean_std

activity.factor<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                   "SITTING","STANDING","LAYING")

# Create average variables for each activity
void<-data.frame(activity.factor)
for (i in 1:79){
  var_meanx<-tapply(data[,i],data$activity.factor,mean)
  var_mean<-data.frame(activity.factor=names(var_meanx), mean=var_meanx)
  colnames(var_mean)<-c("activity.factor",
                        paste("actavg_",names(train_test_mean_std)[i],sep=""))

void<-merge(void,var_mean)
print(i)
}

data1<-merge(data,void,by="activity.factor")

subject<-1:30

# Create average variables for each subject
void2<-data.frame(subject)
for (i in 1:79){
  subj_meanx<-tapply(data[,i],data$subject,mean)
  subj_mean<-data.frame(subject=names(subj_meanx), mean=subj_meanx)
  colnames(subj_mean)<-c("subject",paste("subjavg_",
                                         names(train_test_mean_std)[i],sep=""))
  
  void2<-merge(void2,subj_mean)
  print(i)
}

# Final dataset
data2<-merge(data1,void2,by="subject")

# Export tidy dataset
write.table(data2,"courseproject_tidy_data.txt",col.names=T)

# To read the data
tidy_data<-read.table("courseproject_tidy_data.txt")



