library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(XML)
library(magrittr)

api_key <- ""

api_secret <- ""

access_token <- ""

access_token_secret <- ""

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

######Twitter page search, grab all tweets from certain id (e.g. nytimes)#####
MAX_TWEETS <- 10000
tweets_raw <- userTimeline('nytimes', n = MAX_TWEETS,includeRts = FALSE, excludeReplies = TRUE)

tweets <- ldply(tweets_raw, function(x) {
  data_frame(id = x$id,
             date = as.Date(x$created),
             day = weekdays(date),
             favorites = x$favoriteCount,
             retweets = x$retweetCount,
             title = x$text
  )  })

View(tweets)

######Key word search in Twitter (e.g. Apple)###########

some_tweets<-searchTwitter("Apple",9999)
some_df<-do.call("rbind", lapply(some_tweets, as.data.frame))
dim(some_df)

View(some_df)