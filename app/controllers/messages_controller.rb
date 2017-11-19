class MessagesController < ApplicationController

  def create
    @sender= message_params[:sender]
    if @sender.to_i != 0
      redirect_to new_messages_text_path(sender: @sender, header: generate_header("S"))
    elsif @sender[0] == "@"
      redirect_to new_messages_tweet_path(sender: @sender , header: generate_header("T"))
    elsif @sender == "email"
      redirect_to new_messages_email_path(sender: @sender , header: generate_header("E"))
    else
      @message = Message.new
      render new_messages_path
    end
    #  if @message.save
    #      flash[:notice] = "SMS has been sent."
    #      redirect_to @message
    #    else
    #      flash.now[:alert] = "Message has not been sent."
    #      render "new"
    #    end
  end

  def new
    @message = Message.new
  end

  def message_params
    #Strong parameters. Only these values are permitted to be sent to the Model
    params.require(:message).permit(:sender, :body, :subject)
  end

  def generate_header(header)
    return header + rand(111111111..999999999).to_s
  end
end
