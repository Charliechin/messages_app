class EmailsController < ApplicationController
  def new
    @sender = params[:sender]
    @email = Email.new
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(email_params)
    # TODO BODY AUTH 
    if @email.save
      flash[:notice] = "Email has been sent."
      redirect_to messages_emails_path
    end
  end
  def index
end
  private
  def email_params
    params.require(:email).permit(:sender, :body)
  end
end

