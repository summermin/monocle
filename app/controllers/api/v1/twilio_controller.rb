class Api::V1::TwilioController < Api::V1::BaseController
  def sms_response
    message_body = params["Body"]
    from_number = params["From"]

    sms = SMSNotification.client.messages.create(
      from: SMSNotification::TWILIO_NUMBER,
      to: from_number,
      body: "Hello there, thanks for texting me. Your number is #{from_number}."
    )
  end
end