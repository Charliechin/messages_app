class JsonController < ApplicationController

  def index
    messages_file = Rails.root.join('lib','messages.txt')
    begin
      @file = File.read(messages_file)
      json_data = JSON.parse(@file)
    rescue
      puts "Oops something went wrong reading the file."
      redirect_to messages_path
    end
    @emails = json_data[0]
    @tweets = json_data[1]
    @texts = json_data[2]
  end
end
