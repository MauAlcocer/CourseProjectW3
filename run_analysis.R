# Course Project Week 3

rm(list=ls())
memory.limit(4000)

setwd("C:/Users/Luis Mauricio/Desktop/Coursera Data Science/Getting and cleaning data/Week 3/Course Project")

# 1. Merges the training and the test sets to create one data set.
# Import the data tables of train and test observations, with their 
# corresponding subject and activity indicators. Also, the features 
# dataset with the names of variables in the train and test sets

train<-read.table("UCI HAR Dataset/train/X_train.txt")
subj_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

test<-read.table("UCI HAR Dataset/test/X_test.txt")
subj_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

feat<-read.table("UCI HAR Dataset/features.txt")
names<-as.character(feat$V2)

# train dataset
colnames(train)<-names

colnames(subj_train)<-"subj"
colnames(y_train)<-"y"

train_subj<-cbind(train,subj_train)
train_subj_y<-cbind(train_subj,y_train)

# test dataset
colnames(test)<-names

colnames(subj_test)<-"subj"
colnames(y_test)<-"y"

test_subj<-cbind(test,subj_test)
test_subj_y<-cbind(test_subj,y_test)

# merge
train_test<-rbind(train_subj_y,test_subj_y)

# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 

mean_std<-c(grep("mean()",names(train_test),value=TRUE),
grep("std()",names(train_test),value=TRUE))

train_test_mean_std<-subset(train_test,select=c(mean_std,"subj","y"))

# 3. y 4.

train_test_mean_std$y1<-factor(train_test_mean_std$y,
                               levels=c(1,2,3,4,5,6),
                               labels=c("WALKING",
                                        "WALKING_UPSTAIRS",
                                        "WALKING_DOWNSTAIRS",
                                        "SITTING",
                                        "STANDING",
                                        "LAYING"))

colnames(train_test_mean_std)[80]<-"subject"
colnames(train_test_mean_std)[81]<-"activity.code"
colnames(train_test_mean_std)[82]<-"activity.factor"


# 5.

data<-train_test_mean_std

activity.factor<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                   "SITTING","STANDING","LAYING")
void<-data.frame(activity.factor)
for (i in 1:79){
  var_meanx<-tapply(data[,i],data$activity.factor,mean)
  var_mean<-data.frame(activity.factor=names(var_meanx), mean=var_meanx)
  colnames(var_mean)<-c("activity.factor",paste("actavg_",names(train_test_mean_std)[i],sep=""))

void<-merge(void,var_mean)
print(i)
}

data1<-merge(data,void,by="activity.factor")

subject<-1:30
void2<-data.frame(subject)
for (i in 1:79){
  subj_meanx<-tapply(data[,i],data$subject,mean)
  subj_mean<-data.frame(subject=names(subj_meanx), mean=subj_meanx)
  colnames(subj_mean)<-c("subject",paste("subjavg_",names(train_test_mean_std)[i],sep=""))
  
  void2<-merge(void2,subj_mean)
  print(i)
}

data2<-merge(data1,void2,by="subject")

write.table(data2,"courseproject_tidy_data.txt")


