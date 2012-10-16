class HomeController < ApplicationController
  def index
    tweets = get_tweets
    @current_location = tweets.first.text.partition("-")[0].strip
    @date = tweets.first.created_at.strftime("%a %d %b %Y")
    @betting_pool = "$#{Guess.paid.count * 5}"
  end

  def get_tweets
    Rails.cache.fetch('tweets', :expires_in => 60.minutes) do
      Twitter.user_timeline("yaktracker", :count => 200)
    end
  end
end
