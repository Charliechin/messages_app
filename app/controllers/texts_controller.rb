class TextsController < ApplicationController

  def new
    @sender = params[:sender]
    @text = Text.new
  end

  def show
    binding.pry
    @text = Text.find(params[:id])
  end

  def create
    @text = Text.new(text_params)
    d = Dictionary.new
    expanded_body = d.expand_text(text_params[:body])
    @text.update(expanded_body: expanded_body)
    binding.pry
    if @text.save
      flash[:notice] = "SMS has been sent."
      redirect_to messages_texts_path
    else
      flash.now[:alert] = "SMS has not been sent."
      render 'new'
    end
  end
  private
  def text_params
    #Strong parameters. Only these values are permitted to be sent to the Model
    params.require(:text).permit(:sender, :body)
  end
end
