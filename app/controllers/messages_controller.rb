require 'dictionary'
class MessagesController < ApplicationController

  def create
    binding.pry
    @sender= message_params[:sender]
    if @sender.to_i != 0
      redirect_to new_messages_text_path(sender: @sender)
    elsif @sender[0] == "@"
      # CERRASTE ESTO, REDIRIGE A ALGUN message_tweet bla bla
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

end
