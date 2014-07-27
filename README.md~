=============================================================================================
Information about the original dataset
=============================================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.

=============================================================================================
Information about the analysis files submitted
=============================================================================================
The tidy data set comes with three files:
	- run_analysis.R: script for performing the analysis.
	- CodeBook.md: code book that describes the variables, the data, and any transformations or work that were performed to clean up the data.
	- README.md: This file that explains what the analysis files did. 

=============================================================================================
Information about the analysis steps in "run_analysis.R"
This information is also available together with r code in "run_analysis.R"
=============================================================================================
 1.Merges the training and the test sets to create one data set.

	 - Read in subject/X/y from the training set; combine them into 1 data frame called "data.train".
	 - Read in subject/X/y from the test set; combine them into 1 data frame called "data.test".
	 - Combine the training and test data frames into 1 data frame called "data"; delete other temporary data frames.

 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

	 - Read in the names of the selected features; use these names to update the colnames of "data".
	 - Select only measurements on the mean and standard deviation; subtract these measurements to generate a new data frame called "data2". 
	   ('Subject' and 'Activity' are also subtracted for "data2")

 3.Uses descriptive activity names to name the activities in the data set.

	 - Read in the activity number and names.
	 - Use actual names to replace the numbers for activities in "data2".

 4.Appropriately labels the data set with descriptive variable names. 

	 - Get the original variable names from "data2".
	 - Replace the abbreviations with full words; delete the additional symbols; seperate words with a dot.
	 - Use the updated variable names to rename the variables in "data2".

 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

	 - Split the measurements data of 'data2' by activity and subject; 
	 - get the average of each variable for each activity and each subject;
	 - create a new data frame called "data3" to store these averaged values.
	 - The row names of "data3" are actually "subject"."activity";
	 - split the row names back to "subject" and "activity".
	 - Add the variables "subject" and "activity" back to "data3";
	 - update their colnames and delete the rownames.
	 - Output 'data3' to a table file as the final tidy data set.


