###<b>Running the script</b.>

1. Clone this repository
2. Download the <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">data set</a> and extract. It should result in a 'UCI HAR Dataset' folder that has all the files in the required structure.
3. Change current directory to the 'UCI HAR Dataset' folder.
4. Run Rscript '<path to>/run_analysis.R'
5. The tidy dataset should get created in the current directory as 'tidy_data.txt'
6. Code book for the tidy dataset is available <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here</a>

###<b>Assumptions</b>

- The training and test data are available in folders named `train` and `test` respectively.
- For each of these data sets:
    - Measurements are present in `X_<dataset>.txt` file
    - Subject information is present in `subject_<dataset>.txt` file
    - Activity codes are present in `y_<dataset>.txt` file
- All activity codes and their labels are in a file named `activity_labels.txt`.
- Names of all measurements taken are present in file `features.txt` ordered and indexed as they appear in the `X_<dataset>.txt` files.
- All columns representing means contain `...mean()` in them.
- All columns representing standard deviations contain `...std()` in them.

