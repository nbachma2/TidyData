run_analysis<- function(){
library(dplyr)
#read .txt files
train_val<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_label<-read.table("./data/UCI HAR Dataset/train/Y_train.txt")
train_subj<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
test_val<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_label<-read.table("./data/UCI HAR Dataset/test/Y_test.txt")
test_subj<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
features<-read.table("./data/UCI HAR Dataset/features.txt")
activitylabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt") 
activitylabels[,2] <-tolower(gsub("_","",activitylabels[,2])) #make all activities lowercase

#1. Merge training and test sets to create one data set; do the same with labels

values<-bind_rows(test_val,train_val)
label<-bind_rows(test_label,train_label) 
subjects<-bind_rows(test_subj,train_subj) 


#Assign column names to subject/activity and and measurement names from features
colnames(label)<- "activities"
colnames(subjects) <- "subjects"
colnames(values)<-features[,2]

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
means<-select(values,contains("mean()")) 
stdev<-select(values,contains("std()"))
DT<-cbind(subjects,label,means,stdev)   #combine all columns into one data frame

#3. Uses descriptive activity names to name the activities in the data set
DT$activities<-activitylabels[DT$activities,2]

#4. Appropriately labels the data set with descriptive variable names. 
colnames(DT)<-gsub("^t","time",colnames(DT)) %>%
        gsub("^f","freq",.) %>%
        gsub("Acc","accelerometer",.) %>%
        gsub("Gyro","gyroscope",.) %>%
        gsub("Mag","magnitude",.) %>%
        gsub("-mean\\(\\)","mean",.)  %>%
        gsub("-std\\(\\)","std",.) %>%
        gsub("[()\\-]","",.) %>%
        tolower()


#5. From the data set in step 4, creates a second, 
#   independent tidy data set with the average of each variable for each 
#   activity and each subject.
tidy<- DT %>% group_by(subjects,activities) %>%
        summarize_all(mean)

write.table(tidy,file="tidy.txt",row.names = FALSE)

}