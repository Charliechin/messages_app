class TweetsController < ApplicationController

  def new
    @sender = params[:sender]
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    d = Dictionary.new

    @tweet = Tweet.new(tweet_params)
    @hashtags = []
    body = tweet_params[:body]
    binding.pry
    expanded_body = d.expand_text(body)
    hashtags = get_hashtags(body)
    @tweet.update(expanded_body: expanded_body, hashtag: hashtags)
    if @tweet.save
      flash[:notice] = "Tweet has been sent."
      redirect_to messages_tweets_path
    end
  end


  def index
  end



  private
  def tweet_params
    params.require(:tweet).permit(:sender, :body)
  end

  def get_hashtags(text)
    body = text.split(" ")
    hashtags = []
    body.each do |word_to_check|
      if word_to_check.include? "#"
        hashtags << word_to_check
      end
    end
    hashtags == [] ? nil : hashtags
  end
end
