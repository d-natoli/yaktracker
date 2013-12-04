class HomeController < ApplicationController
  def index
    tweets = get_tweets
    @current_location = tweets.first.text.partition("-")[0].strip
    @date = tweets.first.created_at.strftime("%a %d %b %Y")
    @betting_pool = "$#{Guess.paid.count * 5}"
  end

  def get_tweets
    Rails.cache.fetch('tweets', :expires_in => 60.minutes) do
      twitter_client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV["CONSUMER_KEY"]
        config.consumer_secret = ENV["CONSUMER_SECRET"]
        config.oauth_token = ENV["OAUTH_TOKEN"]
        config.oauth_token_secret = ENV["OAUTH_TOKEN_SECRET"]
      end

      twitter_client.user_timeline("yaktracker", :count => 200)
    end
  end
end
