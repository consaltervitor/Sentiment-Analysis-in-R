**Sentiment Analysis Project**

This project performs sentiment analysis on text files using R. The analysis includes text cleaning, word frequency counting, sentiment analysis, and visualization.

**Installation**

To run this project, you need to have R and RStudio installed on your machine. Additionally, you will need to install the following R packages: tidyverse, tidytext, stringr, wordcloud, textdata, and openxlsx.

**Usage**

Clone the repository:

git clone https://github.com/yourusername/sentiment-analysis-project.git
cd sentiment-analysis-project

Prepare your text files:

Place your text files (e.g., Happy Story.txt and Thriller Story.txt) in a folder, and update the file paths in the script accordingly.

Run the R script:

Open the R script in RStudio and run it to perform sentiment analysis.

**Project Structure**

sentiment-analysis-project/
├── Happy Story.txt
├── Thriller Story.txt
└── sentiment_analysis.R

**Process Overview**

Loading Required Libraries:  Load necessary libraries for data manipulation, text mining, and visualization.

Reading and Preparing Text Data: Read the text files and prepare the data for analysis by splitting the text into individual words.

Cleaning the Text: Clean the text by removing punctuation, converting to lowercase, and removing stop words.

Counting Word Frequencies: Count the frequency of each word and sort the words from highest to lowest frequency.

Visualizing Word Frequencies: Create a bar plot to visualize the word frequencies.

Generating a Word Cloud: Generate a word cloud to visualize the most frequent words.

Sentiment Analysis: Perform sentiment analysis using the NRC sentiment lexicon and visualize the sentiment word counts.

**Contributions are welcome!**

Follow my projects:

https://www.datawithvitor.com.au
