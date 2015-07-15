# Getting and Cleaning Data Project

## Code Book

Firstly, the data from two data sets (train and test) was loaded and merged together.
Secondly, the file features.txt was used to extract rigth names for columns in the merged dataset. The column with data on 30 subjects was labelled "id". The column with data on types of exercises was labelled "activity".
Thirdly, the numbers representing the type of activity (walking, walking_down...) were substracted by the names of activities. 
Afterwards, the columns only with mean and standard deviation were left.
Finally, some names of the columns were changed on more clear.

The variable "data_mean_sd" contains the final data. 
The text file "newdata.txt" contains independent dataset with aggregated data on each subject and type of activity.
