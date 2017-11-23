class JsonController < ApplicationController

  def index
    messages_file = Rails.root.join('lib','messages.txt')
    begin
      @file = File.read(messages_file)
      json_data = JSON.parse(@file)
    rescue
      puts "Oops something went wrong reading the file."
      flash[:notice] = "File is empty. There is no data in the file to be read. Please, send a message first"
      redirect_to messages_path
    end
    unless json_data.nil?
      @emails = json_data[0]
      @tweets = json_data[1]
      @texts  = json_data[2]
    else
      @emails = "File is empty (lib/messages.txt)"
      @tweets = "File is empty (lib/messages.txt)"
      @texts  = "File is empty (lib/messages.txt)"
    end
  end
end
