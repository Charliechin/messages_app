class MessagesController < ApplicationController

  def index
  end

  def new
    binding.pry
    @message = Message.new
  end

  def show
  end

  def create
    binding.pry
    @message = Message.new(message_params)

    if @message.save
      flash[:notice] = "SMS has been sent."
      redirect_to @message
    else
      flash.now[:alert] = "Message has not been sent."
      render "new"
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def message_params
    #Strong parameters. Only these values are permitted to be sent to the Model
    params.require(:message).permit(:sender, :body, :subject)
  end

end
