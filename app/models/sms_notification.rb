class SMSNotification < ActiveRecord::Base
  TWILIO_NUMBER = "+18329004235"

  validates :phone_number, :project_id, presence: true

  def notify
    client.messages.create(
      from: TWILIO_NUMBER,
      to: phone_number,
      body: "Did you do what you said you were going to do today?"
    )
  end

  def client
    @client ||= Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
  end
end