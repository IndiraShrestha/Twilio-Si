class SmsController < ApplicationController
  before_action :set_sm, only: [:show, :edit, :update, :destroy]

  # GET /sms
  # GET /sms.json
  def index
    @sms = Sm.all
  end

  # GET /sms/new
  def new
    @sm = Sm.new
  end
  
  # POST /sms
  # POST /sms.json
  def create
    begin 
    @sm = Sm.new(sm_params)

    if @sm.save 

      acct_sid = Rails.application.secrets.twilio_account_sid
      acct_auth_token = Rails.application.secrets.twilio_auth_token
      @twilio_client = Twilio::REST::Client.new acct_sid, acct_auth_token
    
      @twilio_client.account.messages.create(
      :from => +17812096611,
      :to => sm_params[:Cell_number],
      :body => sm_params[:Message]
      ) 

        format.html { redirect_to root_path, notice: 'Sms was successfully send.' }
        format.json { render :show, status: :created, location: @sm }
    else
        format.html { render :new }
        format.json { render json: @sm.errors, status: :unprocessable_entity }
    end

    rescue => e
      puts e.message
    end

  end


  private


    # # Use callbacks to share common setup or constraints between actions.
    # def set_sm
    #   @sm = Sm.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sm_params
      params.require(:sm).permit(:Cell_number,:Message)
    end

end
