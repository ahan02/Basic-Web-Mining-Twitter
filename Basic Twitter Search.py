from TwitterSearch import *
try:
    tso = TwitterSearchOrder() # create a TwitterSearchOrder object
    tso.set_keywords(['Apple', 'Apple Watch']) 
    tso.set_language('en') 
    tso.set_include_entities(False) 

   
    ts = TwitterSearch(
        consumer_key = '',
        consumer_secret = '',
        access_token = '',
        access_token_secret = ''
     )

     
    for tweet in ts.search_tweets_iterable(tso):
        print( '@%s tweeted: %s' % ( tweet['user']['screen_name'], tweet['text'] ) )

except TwitterSearchException as e: 
    print(e)

