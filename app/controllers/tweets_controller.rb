class TweetsController < ApplicationController

  def new
    @sender = params[:sender]
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    binding.pry
    d = Dictionary.new
    expanded_body = d.expand_text(tweet_params[:body])
    @tweet.update(expanded_body: expanded_body)
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

end
