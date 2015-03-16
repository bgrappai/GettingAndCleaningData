Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition.

1. All the similar data is merged using the rbind() function. 
2. Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
3. As activity data is addressed with values 1:6, take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
4. Label data set with descriptive variable names.
5. Generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to the coursera repository.

Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contains the data from the downloaded files.
x_dat, y_dat and subject_dat merge the previous datasets.
features contains the correct names for the x_dat dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_data merges x_dat, y_dat and subject_dat into a big dataset.
Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans().