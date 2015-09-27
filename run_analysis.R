fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./source",method = "curl")
unzip("source")
setwd(file.path(getwd(),"UCI HAR Dataset"))
testset <- read.table("./test/X_test.txt")
trainingset <- read.table("./train/X_train.txt")
mergedset <- rbind(trainingset,testset)
setnames <- read.table("features.txt")
colindex <- grep("mean|std",setnames$V2)
dataset <- select(mergedset,colindex)
renamed <- gsub("\\()","",setnames$V2)
renamed <- gsub("\\-","",renamed)
renamed <- gsub("\\,","_",renamed)
renamed <- gsub("Acc","Accelerometer",renamed)
renamed <- gsub("Gyro","Gyroscope",renamed)
renamed1 <- renamed[colindex]
dataset <- mergedset[colindex]
names(dataset) <- renamed1
subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")
activity_train <- read.table("./train/y_train.txt") 
activity_test <- read.table("./test/y_test.txt") 
subjest_merged <- rbind(subject_train,subject_test)
names(subjest_merged) <- "subject"
activity_merged <- rbind(activity_train,activity_test)
names(activity_merged) <- "activity"
dataset <- cbind(dataset,subjest_merged,activity_merged)
tidy_data <- group_by(dataset,subject,activity)
tidy_data <- summarise_each(tidy_data,funs(mean))
write.table(tidy_data,file = "tidy_data.txt",row.name = FALSE)
