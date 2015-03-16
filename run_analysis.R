library(plyr)

# Step 1
# Merge the training and test data sets together into one set
#############################################################

x_train <- read.table("train/x_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/x_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_dat <- rbind(x_train, x_test)
y_dat <- rbind(y_train, y_test)
subject_dat <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation
##################################################################

features <- read.table("features.txt")

mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

x_dat <- x_dat[, mean_and_std_features]

names(x_dat) <- features[mean_and_std_features, 2]

# Step 3
# Use activity names to name the activities in the data set
###########################################################

activities <- read.table("activity_labels.txt")
y_dat[, 1] <- activities[y_dat[, 1], 2]
names(y_dat) <- "activity"

# Step 4
# Label the data set with descriptive variable names
####################################################

names(subject_dat) <- "subject"

all_dat <- cbind(x_dat, y_dat, subject_dat)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

averages_dat <- ddply(all_dat, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_dat, "averages_data.txt", row.name=FALSE)