class Api::V1::TwilioController < ApplicationController
  def sms_response
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    sms = SMSNotification.client.messages.create(
      from: SMSNotification::TWILIO_NUMBER,
      to: from_number,
      body: "Hello there, thanks for texting me. Your number is #{from_number}."
    )
  end
end