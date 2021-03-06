GettingCleaningData
===================
Repository contains:
=========================================

-- README.MD: this file
-- run_analysis.R:  R script to take data from UCI HAR Dataset and reshape it to create tidyDataSet
                    data frame which is then saved as tidyDataSet.txt
-- datadictionary.txt: Shows the meta data descriptions for tidyDataSet.txt
-- tidyDataSet.txt: A write.table() without column names created from the tidyDataSet dataframe generated by
                     the run_analysis.R script
-- UCI HAR Dataset directory:

The SAMSUNG dataset includes the following files:
=========================================

-- README.txt
-- features_info.txt: Shows information about the variables used on the feature vector.
-- features.txt: List of all features.
-- activity_labels.txt: Links the class labels with their activity name.
-- train/X_train.txt: Training set.
-- train/y_train.txt: Training labels.
-- test/X_test.txt: Test set.
-- test/y_test.txt: Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

R script:
Written for R version 3.1.2 (2014-10-31) using i386-w64-mingw32/i386 (32-bit) using R Studio

Attached packages:
sqldf_0.4-10
RSQLite_1.0.0
DBI_0.3.1
gsubfn_0.6-6
proto_0.3-10
stringr_0.6.2


require(stringr)
require(sqldf)
working directory is the directory that the script is run from and expects the UCI HAR Dataset directory
Set up working environment
Merge the training and the test sets to create one data set.
Label the data set with descriptive variable names.
Extract only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Restore original environment

the output of the R script is a data frame called tidyDataSet.  If this script works, it should match the dataframe created
from loading tidyDataSet.txt with read.file("tidyDataSet.txt", header = TRUE)

Usage:
source('<your download point>/GettingCleaningData/run_analysis.R')