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


def like

    login_twitter.search('#bonjour_monde').take(2).collect do |tweet|
   puts "#{tweet.user.screen_name}"

    login_twitter.follow(tweet.user.screen_name)

    end

end

like
