*****************************************************************
*								*
*								*
*	For Geatting and Cleaning course			*
*		(Data science on Coursera)			*
*								*
*								*
*****************************************************************


In this folder you can find:

	- A ReadMe markdown document (Readme.md)

	- A run_analysis R script (run_analysis.R)

		* Use the following commands for running the code
			> source('./run_analysis.R')
			> run_analysis()

	- A a Codebook markdown document (UCIDataDictcK.pdf)

		* you can read the tidy data results and put it in a variable "tidy_data" by launching the following command:

			> tidy_data <- read.table("./cKtidy_data.txt", sep = " ")






NB:I have chosen to extract only the features with mean() and std() beacause in the "features_info.txt", the authors
explained that the set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

So "MeanFreq" for instance is not (in a strict way) a mean value
