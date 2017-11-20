class TweetsController < ApplicationController

  def new
    @sender = params[:sender]
    @header = params[:header]
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    d = Dictionary.new

    @tweet = Tweet.new(tweet_params)
    @hashtags = []
    @mentions = []
    body = tweet_params[:body]
    expanded_body = d.expand_text(body)
    hashtags = get_hashtags(body)
    mentions = get_mentions(body)
    @tweet.expanded_body = expanded_body
    @tweet.hashtag = hashtags
    @tweet.mentions = mentions
    if @tweet.save
      flash[:notice] = "Tweet has been sent."
      redirect_to messages_tweets_path
    end
  end


  def index
    @total_hashtags = []
    @hashtag_list = []
    @tweets_with_hashtags = Tweet.where.not('hashtag' => nil)
    #We iterate through tweets with hashtags and store them in a variable
    @tweets_with_hashtags.each do |tweet|
      @total_hashtags << tweet.hashtag
    end
    #As the hashtags are coming as an array, we need to flatten the array of array
    #so we can check the amount of hashtags repeated
    @total_hashtags = @total_hashtags.flatten(1)
    @total_hashtags.each do |item|
      #A little formatting
      @hashtag_list << "#{item}: #{@total_hashtags.count(item)}"
    end
    #After counting, make each element unique
    @hashtag_list = @hashtag_list.uniq

    #Mention list logic
    @total_mentions = []
    @mentions_list = []
    @tweets_with_mentions = Tweet.where.not('mentions' => nil)
    @tweets_with_mentions.each do |tweet|
      @total_mentions << tweet.mentions
    end

    @total_mentions = @total_mentions.flatten(1)
    @total_mentions.each do |item|
      @mentions_list << "#{item}: #{@total_mentions.count(item)}"
    end
    @mentions_list = @mentions_list.uniq


  end



  private
  def tweet_params
    params.require(:tweet).permit(:sender, :body, :header)
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

  def get_mentions(text)
    body = text.split(" ")
    mentions = []
    body.each do |word_to_check|
      if word_to_check.include? "@"
        mentions << word_to_check
      end
    end
    binding.pry
    mentions == [] ? nil : mentions
  end
end
