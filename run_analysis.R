##############################################################################################
# Note: This is the script to perform the data transformation/clean-up steps.
# To run, please put it in the data directory which cantians the following files and folders:
# activity_labels.txt  features_info.txt  features.txt  README.txt  test/  train/
##############################################################################################

#################################################################
# 1.Merges the training and the test sets to create one data set.
#################################################################

# Read in subject/X/y from the training set;
# combine them into 1 data frame called "data.train".
options(stringsAsFactors = FALSE)
data.train.subject=read.table('train/subject_train.txt')
data.train.x=read.table('train/X_train.txt')
data.train.y=read.table('train/y_train.txt')
data.train=cbind(data.train.subject,data.train.y,data.train.x)

# Read in subject/X/y from the test set;
# combine them into 1 data frame called "data.test".
data.test.subject=read.table('test/subject_test.txt')
data.test.x=read.table('test/X_test.txt')
data.test.y=read.table('test/y_test.txt')
data.test=cbind(data.test.subject,data.test.y,data.test.x)

# Combine the training and test data frames into 1 data frame called "data";
# delete other temporary data frames.
data=rbind(data.train,data.test)
rm(list=ls(pattern=glob2rx('data.*')))

#################################################################
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#################################################################

# Read in the names of the selected features;
# use these names to update the colnames of "data".
labels.features=read.table('features.txt')[,2]
data.names=c('Subject','Activity',labels.features)
colnames(data)=data.names

# Select only measurements on the mean and standard deviation;
# subtract these measurements to generate a new data frame called "data2".
# Note: 'Subject' and 'Activity' are also subtracted for "data2".
index=sort(c(grep('mean\\(\\)',data.names),grep('std\\(\\)',data.names)))
data2=data[,c(1,2,index)]

#################################################################
# 3.Uses descriptive activity names to name the activities in the data set.
#################################################################

# Read in the activity number and names;
# use actual names to replace the numbers for activities in "data2".
labels.activity=read.table('activity_labels.txt')
labels.activity.number=labels.activity[,1]
labels.activity.names =labels.activity[,2]
data2$Activity=labels.activity.names[match(data2$Activity,labels.activity.number)]

#################################################################
# 4.Appropriately labels the data set with descriptive variable names. 
#################################################################

# Get the original variable names from "data2".
data2.names=names(data2)

# Replace the abbreviations with full words; 
# delete the additional symbols; 
# seperate words with a dot.
data2.names=gsub('^t','Time.',data2.names)
data2.names=gsub('Body','Body.',data2.names)
data2.names=gsub('Acc','Acceleration.',data2.names)
data2.names=gsub('Gravity','Gravity.',data2.names)
data2.names=gsub('Jerk','Jerk.',data2.names)
data2.names=gsub('Gyro','Gyroscope.',data2.names)
data2.names=gsub('Mag','Magnitude.',data2.names)
data2.names=gsub('mean\\(\\)','Mean.',data2.names)
data2.names=gsub('std\\(\\)','STD.',data2.names)
data2.names=gsub('^f','Frequency.',data2.names)
data2.names=gsub('[-\\(\\)]','',data2.names)
data2.names=gsub('\\.$','',data2.names)
data2.names=gsub('Body.Body','Body',data2.names)

# Use the updated variable names to rename the variables in "data2".
names(data2)=data2.names

#################################################################
# 5.Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
#################################################################

# Split the measurements data of 'data2' by activity and subject;
# get the average of each variable for each activity and each subject;
# create a new data frame called "data3" to store these averaged values.
data2.ncol=ncol(data2)
data2.splitted=split(data2[,3:data2.ncol],list(data2$Subject,data2$Activity),drop = T)
data3=as.data.frame(t(sapply(data2.splitted,colMeans)))

# The row names of "data3" are actually "subject"."activity";
# split the row names back to "subject" and "activity".
data3.labels=strsplit(rownames(data3),'\\.')
data3.subjects=as.numeric(sapply(data3.labels,function(x) x[1]) )
data3.activity=sapply(data3.labels,function(x) x[2])

# Add the variables "subject" and "activity" back to "data3";
# update their colnames and delete the rownames.
data3=cbind(data3.subjects,data3.activity,data3)
colnames(data3)[1:2]=c('Subject','Activity')
rownames(data3)=NULL

# Output 'data3' to a table file as the final tidy data set.
write.table(data3,'TidyDataSet.txt',row.names=F)

