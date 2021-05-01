
## Download data zip file, unzip and put into current working directory

## Load file into R space 
  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
  
## 1. Combine all data into 1 big data set
  
  ## 1.1 Combine data of both testing and training, by x - y - subject
  X <- rbind(x_test,x_train)
  Y <- rbind(y_test,y_train)
  S <- rbind(subject_test,subject_train)
  
  ## 1.2. Combine all (x-observation, y-activity, s-subject)
  data <- cbind(S,Y,X)

## 2. Extract mean and standard deviation
  M_SD <- data %>% select(subject,code,contains("mean"),contains("std"))

## 3. Change code by activity's names
  
  ## 3.1. Add column "activities"
  M_SD <- merge(activities,M_SD,by="code")
  
  ## 3.2. Remove column "code"
  M_SD <- subset(M_SD, select=-code)
  
## 4. Creating a second, independent tidy data set with the average of each variable
## for each activity and each subject
  
  ## 4.1. Group by subject and activity
  Final <- group_by(M_SD,subject,activity)
  Final <- summarise_all(Final,funs(mean))
  ## 4.2. Write data into txt file
  write.table(Final, "Final.txt", row.name=FALSE)
