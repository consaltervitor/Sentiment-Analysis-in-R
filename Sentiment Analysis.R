library(tidyverse)
library(tidytext)
library(stringr)
library(wordcloud)
library(textdata)
library(openxlsx)

install.packages("wordcloud")
install.packages("textdata")

# Read the text file
text <- readLines("C:\\Users\\vitor\\Downloads\\Text Mining R\\Happy Story.txt")
#text <- readLines("C:\\Users\\vitor\\Downloads\\Text Mining R\\Thriller Story.txt")

# Split text into words and create a data frame
df_original <- data.frame(words = character(0))

for(i in 1:length(text)){
  words <- strsplit(text, "\\s+")[[i]]
  df_original <- rbind(df_original, data.frame(words))
}
view(df_original)

# Remove unnecessary variables
# rm(i)
# rm(text)
# rm(words)
# rm(tidy_text)
# rm(clean_df)
# rm(df_original)


# Clean the text by removing punctuation, converting to lowercase, and removing stop words
tidy_text <- df_original %>%
  unnest_tokens(word, words) %>%
  anti_join(stop_words) 

view(tidy_text)

# Count the frequency of each word and sort from highest to lowest
tidy_count <- tidy_text %>%
    count(word) %>%
    filter(n > 1) %>%
    arrange(desc(n))

view(tidy_count)

# Create a bar plot of word frequencies
ggplot(tidy_count, aes(x = word, y = n)) +
  geom_col() +
  coord_flip()    

# Generate a word cloud of the text
wordcloud(
  words = tidy_count$word,                                           
  freq = tidy_count$n,                                               
  max.words = 200
)

# Sentiment Analysis #
# Display a list of all sentiments
get_sentiments("nrc") %>% count(sentiment) %>% arrange(desc(n))

# Perform sentiment analysis on the text
sentiment_text <- tidy_text %>% 
  inner_join(get_sentiments("nrc"))

          # palavras que estão fora da lista
          # sentiment_text2 <- tidy_text %>% left_join(get_sentiments("nrc"))
          # rm(sentiment_text2)

# View the first 49 rows of the sentiment analysis results
head(sentiment_text, n = 49)

# Count and display the number of words associated with each sentiment
sentiment_text %>% 
  count(sentiment) %>% 
  arrange(desc(n))

# Count word frequencies for words associated with sentiments
sentiment_count <- tidy_text %>% 
  count(word) %>% 
  inner_join(get_sentiments("nrc")) %>%
  arrange(desc(n))

# View the top 10 words associated with sentiments
head(sentiment_count, n = 10)

# Saving as .xlsx
openxlsx::write.xlsx(sentiment_count, file = "C:\\Users\\vitor\\Downloads\\Text Mining R\\Happy_df.xlsx")
  
# Create a bar plot of sentiment word counts, faceted by sentiment
ggplot(sentiment_count, aes(x = word, y = n, fill = sentiment)) + 
  geom_col(show.legend = FALSE) +
  facet_wrap(~ sentiment, scales = "free") +  
  coord_flip() +
  labs(   
    title = "Sentiment Word Counts",
    x = "Words"
  )
