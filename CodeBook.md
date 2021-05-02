# GettingAndCleaningData

There are 5 steps required as described in the course project’s definition
  
  First of all, data.zip is dowmloaded, unziped in the project's working respitory. The data contains number .txt files 
  
  1. Merges the training and the test sets to create one data set
    Using `read.table` to load a list of .txt files into R, with suitable collumn names
    `features` <- `features.txt` : 561 rows, 2 columns - names list of features 
    `activities` <- `activity_labels.txt` : 6 rows, 2 columns - names list of activities and their coressponding codes 
    `subject_test` <- `test/subject_test.txt` : 2947 rows, 1 column - code for subjects which do the activities/ data test
    `x_test` <- `test/X_test.txt` : 2947 rows, 561 columns - observations in testing set
    `y_test` <- `test/y_test.txt` : 2947 rows, 1 columns - code activities for testing set
    `subject_t` <- `test/subject_test.txt` : 7352 rows, 1 column - code for subjects which do the activities/ data train
    `x_test` <- `test/X_test.txt` : 7352 rows, 561 columns - observations in training set
    `y_test` <- `test/y_test.txt` : 7352 rows, 1 columns - code activities for training set
    
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
    Using `cbind` `rbind` to merge data into 1 big data set
    Using `select` to extract collumn with features "mean" and "std"
    
  3. Uses descriptive activity names to name the activities in the data set
    Using `merge` to add 1 collumn corespond the activity codes
    
  4. Appropriately labels the data set with descriptive variable names
    Using `subset` to delete the "code" collumn, which repeat information of new collumn
    
  5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    Using `group_by` to sort data by subject and activity, then use `summarise_all` to calculate mean
    Create final data files with `write.table`
