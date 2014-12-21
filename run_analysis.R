# 0. Set up working environment
require(stringr)
require(sqldf)
saveWorkingDirectory <- getwd()
relativeWorkDir <- "UCI Har Dataset"
if (!str_detect(saveWorkingDirectory, relativeWorkDir)) setwd("UCI Har Dataset")

# Merge the training and the test sets to create one data set.
trainSubjectMeasure <- cbind(read.table("train\\subject_train.txt"),
                             read.table("train\\y_train.txt"),
                             read.table("train\\x_train.txt"))
testSubjectMeasure <- cbind(read.table("test\\subject_test.txt"),
                             read.table("test\\y_test.txt"),
                             read.table("test\\x_test.txt"))
subjectMeasurements <- rbind(testSubjectMeasure, trainSubjectMeasure)

# Appropriately label the data set with descriptive variable names.
vectorOfColNames <- c("subject", "activities")
measureLabels <- read.table("features.txt")
measureLabels <- measureLabels[str_detect(measureLabels$V2, "mean") | str_detect(measureLabels$V2, "std"), ]
for (x in measureLabels[2]) vectorOfColNames <- c(vectorOfColNames, as.character(x))
colnames(subjectMeasurements) <- vectorOfColNames

# Extract only the measurements on the mean and standard deviation for each measurement.
subjectMeasurements <- subjectMeasurements[vectorOfColNames]

# Uses descriptive activity names to name the activities in the data set.
activityVector <- c("WALKING" ,"WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
for (x in 1:6) subjectMeasurements[subjectMeasurements$activities == x, 2] <- activityVector[x]

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
statement <- "select subject, activities"                         # Start of SQL statement
for (x in 3:81) statement <- paste0(statement,                    # Build the rest of the select
                                    ", avg(\"",
                                    colnames(subjectMeasurements)[x],
                                    "\") '[",
                                    colnames(subjectMeasurements)[x],
                                    "]'")
statement <- paste0(statement,                                    # Add source and group by
                    " from subjectMeasurements group by subject, activities")
tidyDataSet <- sqldf(statement)

# Restore original environment
setwd(saveWorkingDirectory)
