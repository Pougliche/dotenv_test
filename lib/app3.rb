require 'twitter'
require 'pry'
require 'dotenv'

Dotenv.load('.env') 
 
def login_twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

end

def login_stream
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
    
    end


def twitstream

    topics = ["#starwars"]
    login_stream.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)          

  login_twitter.favorite(object)
  login_twitter.follow(object.user.screen_name)

end

end

twitstream