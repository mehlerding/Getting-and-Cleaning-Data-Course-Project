# load the dplyr package
library(dplyr)
#
# read the training and testing files into R
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
#
# read the features and activity labels into R
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
#
# merge data into a single table
train <- bind_cols(subject_train, x_train, y_train)
test <- bind_cols(subject_test, x_test, y_test)
table <- bind_rows(train, test)
#
# specify column names
colnames(table) <- c("subject", as.character(features[, 2]), "activity")
colnames(activity_labels) <- c("activity", "activitydesc")
#
# add activity name through a join
activity_labels[,1] <- as.integer(activity_labels[,1])
table <- left_join(activity_labels, table, by = "activity")
#
# remove unwanted columns
columns <- grepl("subject|activity|mean|std", colnames(table))
table <- table[, columns]
table <- table[, -(1)]
#
# re-order columns 1 and 2
table <- table[, c(2, 1, 3:81)]
#
# group by subject and activity and summarize by mean 
table2 <- table %>% group_by(subject, activitydesc) %>% summarize_all(funs(mean)) 
#
# write table2 to tidy_data_means.txt
write.table(table2, "tidy_data_means.txt", row.names = FALSE, quote = FALSE)
