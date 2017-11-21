class EmailsController < ApplicationController
  def new
    @sender = params[:sender]
    @header = params[:header]
    @incident_options = {
      "Theft of Properties" => "Theft of Properties",
      "Staff Attack" => "Staff Attack",
      "Device Damage" => "Device Damage",
      "Raid" => "Raid",
      "Customer Attack" => "Customer Attack",
      "Staff Abuse" => "Staff Abuse",
      "Bomb Threat" => "Bomb Threat",
      "Terrorism" => "Terrorism",
      "Suspicious Incident" => "Suspicious Incident",
      "Spot Injury" => "Spot Injury",
      "Personal Info Leak" => "Personal Info Leak"
    }


    #READ TO DO IN views/emails/new.html.erb
    @email = Email.new
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      flash[:notice] = "Email has been sent."
      redirect_to messages_emails_path
    end
  end
  def index
  end
  private
  def email_params
    params.require(:email).permit(:sender, :header, :subject, :body, :incident, :centre_code)
  end
end

