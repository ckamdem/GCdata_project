run_analysis <- function(){ 
        library(dplyr)
        library(tidyr)
        
        #1 Merges the training and the test sets to create one data set.
        
                # read features
        features <- read.table("./UCI HAR Dataset/features.txt", sep = " ")
        
                # read test data, assign names from "features" extracted above 
        test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
        names(test_data) <- as.vector(features[,2])
        
                #Avoid duplicate names of columns
        valid_column_names <- make.names(names=names(test_data), unique=TRUE, allow_ = TRUE)
        names(test_data) <- valid_column_names
        
                 # read labels and subject Id for test data
        test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("Labels"))
        test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject_Id"))
        
                #Concatene for obtaining the whole test dataframe: 2947x563
        test_df <- cbind(test_subject, test_labels, test_data)
        
                # read train data, assign names from "features" extracted above 
        train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
        names(train_data) <- as.vector(features[,2])
 
                #Avoid duplicate names of columns
        valid_column_names <- make.names(names=names(train_data), unique=TRUE, allow_ = TRUE)
        names(train_data) <- valid_column_names
        
                # read labels and subject Id for test data
        train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("Labels"))
        train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject_Id"))
        
                #Concatene for obtaining the whole train dataframe: 7352x563
        train_df <- cbind(train_subject, train_labels, train_data)
  
                #Merge data for obtaining the dull dataframe: 10299x563
        full_data <- rbind(test_df, train_df)

        #2-  Extracts only the measurements on the mean and standard deviation for each measurement
        full_mean <- select(full_data, contains("mean.", ignore.case=FALSE))
        full_sd <- select(full_data, contains("std.", ignore.case=TRUE))
        full_data <- cbind(subject_Id = full_data$subject_Id, Labels = full_data$Labels, full_mean, full_sd )
        print(str(full_data))

        #3-  Uses descriptive activity names to name the activities in the data set
                # extract activity names
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Labels", "activity"))
        
                #associate each label activity with the appropriate name
        tidy_data1 <- merge(full_data, activity_labels)

        #4-  Appropriately labels the data set with descriptive variable names:
                #         I described all the variables in the associated codeBook
                
        #5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
        #for each activity and each subject.
        
                #During the merge I still have a label column, with number added to the activity column with name. I remove the Label column(1)
                #and I reorder all the columns in order to put the added column activity(69) at the beginning
        #print(head(tidy_data1,2))
        tidy_data2 <- tidy_data1[, c(69, 2:68)]
        
                # aggregate and perform computation per group
        tidy_data <- aggregate(tidy_data2[, 3:68], list(tidy_data2$activity,  tidy_data2$subject_Id), mean)
        
                # write the output in a text file
        #write.table(tidy_data, file = "./cKtidy_data.txt",sep = " ", col.names = TRUE, row.names = FALSE)
        
                # A friendly message for the users ;-)
        print("The dimension of your final dataset is:")
        print(str(tidy_data))

        
        }